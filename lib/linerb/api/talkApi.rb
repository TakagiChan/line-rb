class TalkApi
  def initialize(client)
    @client = client
    @reqSeq = 0
  end
end

def api_sendMessage(text:, to:, **param)
  mes = Message.new
  mes::text = text
  mes::to = to
  mes::contentType = param[:contentType]
  @client.sendMessage(@reqSeq += 1, mes)
end

def api_deleteOtherFromChat(chatMid:, targetUserMids:)
  del = DeleteOtherFromChatRequest.new
  del::chatMid = chatMid
  del::targetUserMids = "[#{targetUserMids}]"
  @client.deleteOtherFromChat(0, del)
end