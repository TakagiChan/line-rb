$:.push('./gen-rb')

require_relative 'auth'
require_relative 'gen-rb/talk_service'

class LineClient

  def initialize(authToken:, certificate:)
    @a = authToken
    @c = certificate
  end

  def doAuthService
    Auth.new(authToken: @a, certificate: @c).login
  end

  def getTalkService
    transport = Thrift::HTTPClientTransport.new(Config::TALK_SERVICE_V4_URL)
    transport.add_headers(Config::HEADERS)

    protocol = Thrift::CompactProtocol.new(transport)

    client = TalkService::Client.new(protocol)

    return client
  end

  def getPollService
    transport = Thrift::HTTPClientTransport.new(Config::POLL_SERVICE_V4_URL)
    transport.add_headers(Config::HEADERS)

    protocol = Thrift::CompactProtocol.new(transport)

    client = TalkService::Client.new(protocol)

    return client
  end
end
