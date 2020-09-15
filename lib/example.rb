require_relative './linerb/config'
require_relative './linerb/client'

require_relative './linerb/api/talkApi'

client = LineClient.new(authToken: "", certificate: "")
client.doAuthService
talkClient = client.getTalkService
pollClient = client.getPollService

#talk = TalkApi.new(talkClient)
#talk.send(:api_sendMessage, text: "", to: "gid")
