$:.push('./gen-rb')

require 'thrift'
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

    def initialize(authToken:, certificate:)
      @a = authToken
      @c = certificate

      #authToken login is in progress
    end

    def client_proto(url, headers)

      transport = Thrift::HTTPClientTransport.new(url)
      transport.add_headers(headers)

      protocol = Thrift::CompactProtocol.new(transport)

      return protocol
    end

    def login
      protocol = client_proto(Config::LOGIN_URL, Config::HEADERS)
      loginClient = SecondaryQrcodeLoginService::Client.new(protocol)

      sessionId = loginClient.createSession(CreateQrSessionRequest).authSessionId

      qr_req = CreateQrCodeRequest.new
      qr_req::authSessionId = sessionId

      qr_url = loginClient.createQrCode(qr_req).callbackUrl

      secret = Base64.strict_encode64(SecureRandom.base64(32))
      version = 1
      e2ee = "?secret=#{secret}" + "&e2eeVersion=#{version}"
      puts "[LOGIN] => " + qr_url + e2ee

      Config::HEADERS[:"X-Line-Access"] = ""

      protocol = client_proto(Config::PERMIT_NOTICE_URL, Config::HEADERS)
      certClient = SecondaryQrCodeLoginPermitNoticeService::Client.new(protocol)

      qr_check = CheckQrCodeVerifiedRequest.new
      qr_check::authSessionId = sessionId

      begin
        certClient.checkQrCodeVerified(qr_check)

      rescue Net::ReadTimeout
        puts "[Timeout] QrCode verification"
        exit(1)
      end

      Config::HEADERS.delete(:"X-Line-Access") #=> ""

      protocol = client_proto(Config::LOGIN_URL, Config::HEADERS)
      loginClient = SecondaryQrcodeLoginService::Client.new(protocol)

      begin

        certificate_check = VerifyCertificateRequest.new
        certificate_check::authSessionId = sessionId
        certificate_check::certificate = @certificate

        loginClient.verifyCertificate(certificate_check)

        login_req = QrCodeLoginRequest.new
        login_req.authSessionId = sessionId
        login_req.systemName = "Ruby on Rails"
        login_req.autoLoginIsRequired = FALSE

        res = loginClient.qrCodeLogin(login_req)

        puts "[CERT] => " + res.certificate
        puts "[TOKEN] => " + res.accessToken

        Config::HEADERS[:"X-Line-Access"] = res.accessToken

      rescue SecondaryQrCodeException
        pin_req = CreatePinCodeRequest.new
        pin_req::authSessionId = sessionId
        pincode = loginClient.createPinCode(pin_req).pinCode

        if pincode != nil then
          puts "[PIN] => " + pincode
          pin_check = CheckPinCodeVerifiedRequest.new
          pin_check::authSessionId = sessionId

          begin
            certClient.checkPinCodeVerified(pin_check)

            login_req = QrCodeLoginRequest.new
            login_req.authSessionId = sessionId
            login_req.systemName = "Ruby on Rails"
            login_req.autoLoginIsRequired = FALSE

            res = loginClient.qrCodeLogin(login_req)

            puts "[CERT] => " + res.certificate
            puts "[TOKEN] => " + res.accessToken

            Config::HEADERS[:"X-Line-Access"] = res.accessToken

          rescue Net::ReadTimeout
            puts "[Timeout] PinCode verification"
            exit(1)
          end
        end
      end
    end
  end
end
