require_relative 'auth'
require_relative 'gen-rb/talk_service'

class LineClient

  def initialize(auth_token:, certificate:)
    @auth = auth_token
    @cert = certificate
  end

  def get_talk_service
    transport = Thrift::HTTPClientTransport.new(Config::TALK_SERVICE_V4_URL)
    transport.add_headers(Config::HEADERS)

    protocol = Thrift::CompactProtocol.new(transport)

    TalkService::Client.new(protocol)
  end

  def get_poll_service
    transport = Thrift::HTTPClientTransport.new(Config::POLL_SERVICE_V4_URL)
    transport.add_headers(Config::HEADERS)

    protocol = Thrift::CompactProtocol.new(transport)

    TalkService::Client.new(protocol)
  end

  def do_auth_service
    Auth.new(auth_token: @auth, certificate: @cert).login
  end
end
