require "linerb"

client = LineClient.new(authToken: "", certificate: "")
client.doAuthService
talkClient = client.getTalkService
pollClient = client.getPollService

talk = TalkApi.new(talkClient)
talk.send(:api_sendMessage, text: "Test", to: "gid")
