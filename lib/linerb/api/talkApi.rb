$:.push('./gen-rb')

class TalkApi
  def initialize(client)
    @client = client
  end
end
  def api_sendMessage(text:, to:)
    mes = Message.new
    mes:: text = text
    mes::to = to
    @client.sendMessage(0, mes)
    end