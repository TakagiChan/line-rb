require 'openssl'
require "base64"
require 'cgi'
require 'securerandom'

require_relative 'config'

require_relative 'gen-rb/takagi_chan_types'
require_relative 'gen-rb/secondary_qrcode_login_service'
require_relative 'gen-rb/secondary_qr_code_login_permit_notice_service'

begin

  class Auth

    def initialize(auth_token:, certificate:)
      @auth = auth_token
      @cert = certificate
    end

    def client_proto(url, headers)

      transport = Thrift::HTTPClientTransport.new(url)
      transport.add_headers(headers)

      Thrift::CompactProtocol.new(transport)
    end

    def login

      unless @auth.empty?
        Config::HEADERS.store(:"X-Line-Access", @auth)
        return
      end

      protocol = client_proto(Config::LOGIN_URL, Config::HEADERS)
      login_client = SecondaryQrcodeLoginService::Client.new(protocol)

      session_id = login_client.createSession(CreateQrSessionRequest).authSessionId

      qr_req = CreateQrCodeRequest.new
      qr_req::authSessionId = session_id

      qr_url = login_client.createQrCode(qr_req).callbackUrl

      secret = Base64.strict_encode64(SecureRandom.base64(32))
      version = 1
      e2ee = "?secret=#{secret}" + "&e2eeVersion=#{version}"
      puts "LINE-RB: [LOGIN] => #{qr_url}#{e2ee}"

      Config::HEADERS.store(:"X-Line-Access", session_id)

      protocol = client_proto(Config::PERMIT_NOTICE_URL, Config::HEADERS)
      cert_client = SecondaryQrCodeLoginPermitNoticeService::Client.new(protocol)

      qr_check = CheckQrCodeVerifiedRequest.new
      qr_check::authSessionId = session_id

      begin
        cert_client.checkQrCodeVerified(qr_check)

      rescue Net::ReadTimeout
        puts "\nLINE-RB: [Timeout] QrCode verification\n"
        exit(1)
      end

      Config::HEADERS.delete(:"X-Line-Access") #=> ""

      protocol = client_proto(Config::LOGIN_URL, Config::HEADERS)
      login_client = SecondaryQrcodeLoginService::Client.new(protocol)

      begin

        certificate_check = VerifyCertificateRequest.new
        certificate_check::authSessionId = session_id
        certificate_check::certificate = @cert

        login_client.verifyCertificate(certificate_check)

        login_req = QrCodeLoginRequest.new
        login_req.authSessionId = session_id
        login_req.systemName = "Ruby on Rails"
        login_req.autoLoginIsRequired = FALSE

        res = login_client.qrCodeLogin(login_req)

        #DO NOT SHOW IN PUBLIC
        #DO NOT EDIT IF YOU DONT KNOW WHAT YOU ARE DOING
        #puts "LINE-RB: [CERT] " + Base64.strict_encode64(res.certificate)
        #puts "LINE-RB: [TOKEN] " + Base64.strict_encode64(res.accessToken)

        Config::HEADERS[:"X-Line-Access"] = res.accessToken

      rescue SecondaryQrCodeException
        pin_req = CreatePinCodeRequest.new
        pin_req::authSessionId = session_id
        pincode = login_client.createPinCode(pin_req).pinCode

        if pincode != nil
          puts "LINE-RB: [PIN] => #{pincode}\n"
          pin_check = CheckPinCodeVerifiedRequest.new
          pin_check::authSessionId = session_id

          begin
            cert_client.checkPinCodeVerified(pin_check)

            login_req = QrCodeLoginRequest.new
            login_req.authSessionId = session_id
            login_req.systemName = "LINELITE"
            login_req.autoLoginIsRequired = FALSE

            res = login_client.qrCodeLogin(login_req)

            #DO NOT SHOW IN PUBLIC
            #DO NOT EDIT IF YOU DONT KNOW WHAT YOU ARE DOING
            #puts "LINE-RB: [CERT] " + Base64.strict_encode64(res.certificate)
            #puts "LINE-RB: [TOKEN] " + Base64.strict_encode64(res.accessToken)

            Config::HEADERS[:"X-Line-Access"] = res.accessToken

            puts "\nLINE-RB: [LOGIN SUCCESS]\n"

          rescue Net::ReadTimeout
            puts "\nLINE-RB: [Timeout] PinCode verification\n"
            exit(1)
          end
        end
      end
    end
  end
end
