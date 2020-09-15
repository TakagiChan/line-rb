## Installation
```bash
$ gem install linerb
```
## Usage
```ruby
#lib/example.rb
#Use -W0 to avoid duplication warnings

LineClient.new(authToken: "", certificate: "")
client.doAuthService
talkClient = client.getTalkService
pollClient = client.getPollService

talk = TalkApi.new(talkClient)
talk.send(:api_sendMessage, text: "Test", to: "gid")
```

### gen-rb made by TakagiChanParser

<img src="https://camo.githubusercontent.com/b679caea47becef33a5bfcef1850784f59496ab6/68747470733a2f2f7062732e7477696d672e636f6d2f6d656469612f45686556546169553441414a4e4d4e3f666f726d61743d6a7067" width="600" height="402">

[TakagiChanParser](https://github.com/TakagiChan/LineThriftParsed)

### Contact

[Twitter](https://twitter.com/TakagiChanDayo)

![LINE](https://i.imgur.com/2Cc6vJj.png)
