class TalkApi
  def initialize(client)
    @client = client
    @reqSeq = 0
  end
end

def api_sendChatChecked(chatMid:, lastMessageId:, sessionId:)
  @client.sendChatChecked(0, chatMid, lastMessageId, sessionId)
end

def api_createChatRoomAnnouncement(chatRoomMid:, type:, contents:)
  @client.createChatRoomAnnouncement(0, chatRoomMid, type, contents)
end

def api_createRoomV2(contactIds:)
  contactIds = "[#{contactIds}]"
  @client.createRoomV2(0, contactIds)
end

def api_updateProfileAttributes(profileAttributes:)
  obj = UpdateProfileAttributesRequest.new
  obj::profileAttributes = profileAttributes
  @client.updateProfileAttributes(0, obj)
end

def api_sendMessage(text:, to:, **params)
  obj = Message.new
  obj::text = text
  obj::to = to
  obj::contentType = params[:contentType]
  @client.sendMessage(@reqSeq += 1, obj)
end

def api_sendChatRemove(chatMid:, lastMessageId:, sessionId:)
  @client.sendChatRemoved(0, chatMid, lastMessageId, sessionId)
end

def api_removeAllMessages(lastMessageId:)
  @client.removeAllMessages(0, lastMessageId)
end

def api_blockContact(id:)
  @client.blockContact(0, id)
end

def api_getContact(id:)
  @client.getContact(id)
end

def api_acceptChatInvitation(chatMid:)
  obj = AcceptChatInvitationRequest.new
  obj::reqSeq = 0
  obj::chatMid = chatMid
  @client.acceptChatInvitation(obj)
end

def api_acceptChatInvitationByTicket(chatMid:, ticketId:)
  obj = AcceptChatInvitationByTicketRequest.new
  obj::reqSeq = 0
  obj::chatMid = chatMid
  obj::ticketId = ticketId
  @client.acceptChatInvitationByTicket(obj)
end

def api_getProfile(syncReason:)
  @client.getProfile(syncReason)
end

def api_cancelChatInvitation(chatMid:, targetUserMids:)
  obj = CancelChatInvitationRequest.new
  obj::reqSeq = 0
  obj::chatMid = chatMid
  obj::targetUserMids = "[#{targetUserMids}]"
  @client.cancelChatInvitation(obj)
end

def api_deleteOtherFromChat(chatMid:, targetUserMids:)
  obj = DeleteOtherFromChatRequest.new
  obj::reqSeq = 0
  obj::chatMid = chatMid
  obj::targetUserMids = "[#{targetUserMids}]"
  @client.deleteOtherFromChat(obj)
end

def api_deleteSelfFromChat(chatMid:, **params)
  obj = DeleteSelfFromChatRequest.new
  obj::reqSeq = 0
  obj::chatMid = chatMid
  obj::lastSeenMessageDeliveredTime = params[:lastSeenMessageDeliveredTime]
  obj::lastSeenMessageId = params[:lastSeenMessageId]
  obj::lastMessageDeliveredTime = params[:lastMessageDeliveredTime]
  obj::lastMessageId = params[:lastMessageId]
  @client.deleteSelfFromChat(obj)
end

def api_findChatByTicket(ticketId:)
  obj = FindChatByTicketRequest.new
  obj::ticketId = ticketId
  @client.findChatByTicket(0, obj)
end

def api_findAndAddContactsByMid(mid:, type:, reference:)
  @client.findAndAddContactsByMid(0, mid, type, reference)
end

def api_inviteIntoChat(chatMid:, targetUserMids:)
  obj = InviteIntoChatRequest.new
  obj::reqSeq = 0
  obj::chatMid = chatMid
  obj::targetUserMids = "[#{targetUserMids}]"
  @client.inviteIntoChat(obj)
end

def api_generateUserTicket(expirationTime:, maxUseCount:)
  @client.generateUserTicket(expirationTime, maxUseCount)
end

def api_reissueChatTicket(groupMid:)
  obj = ReissueChatTicketRequest.new
  obj::reqSeq = 0
  obj::groupMid = groupMid
  @client.updateChat(obj)
end

def api_updateChat(chat:, updatedAttribute:)
  obj = UpdateChatRequest.new
  obj::reqSeq = 0
  obj::chat = chat
  obj::updatedAttribute = updatedAttribute
  @client.updateChat(obj)
end

def api_getChats(chatMids:, **params)
  obj = GetChatsRequest.new
  obj::chatMids = "[#{chatMids}]"
  obj::withMembers = params[:withMembers]
  obj::withInvitees = params[:withInvitees]
  @client.getChats(obj)
end