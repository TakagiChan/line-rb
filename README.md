## Installation
```bash
$ gem install linerb
```
## Usage
```ruby

# Please read example.rb basically README is outdated

# lib/example.rb

# USE -W0 --jit

require 'linerb'

class Client
  client = LineClient.new(auth_token: "", certificate: "")
  client.do_auth_service

  talk_client = client.get_talk_service
  @talk = TalkApi.new(talk_client)

  poll_client = client.get_poll_service
  @poll = PollApi.new(poll_client)

  def self.talk
    @talk
  end

  def self.poll
    @poll
  end
end

class PollRecv
  alias_method :__op_process__, :op_process

  def op_process(op)
    Async do
      if op::type == J0_a_e_a_b_nd::RECEIVE_MESSAGE
        if op::message::toType == J0_a_e_a_b_zc::BOT
          return
        end
        Client.talk.send(:api_sendMessage, text: "text", to: "mid/gid",
                         #Optional you dont need pass this args
                         :contentType => J0_a_e_a_b_c9::NONE)
      end
      if op::type == J0_a_e_a_b_nd::NOTIFIED_INVITE_INTO_CHAT
        gid = op::param1
        Client.talk.send(:api_acceptChatInvitation, chatMid: gid)
        Client.talk.send(:api_sendMessage, text: "text", to: gid)
      end
    end
  end

  private :__op_process__
end

Async do
  Client.poll.send(:api_fetch_operations)
end

```

### gen-rb made by TakagiChanParser

<img src="https://camo.githubusercontent.com/b679caea47becef33a5bfcef1850784f59496ab6/68747470733a2f2f7062732e7477696d672e636f6d2f6d656469612f45686556546169553441414a4e4d4e3f666f726d61743d6a7067" width="600" height="402">

[TakagiChanParser](https://github.com/TakagiChan/LineThriftParsed)

### Contact

[Discord Group](https://discord.gg/udujncd)

[Twitter](https://twitter.com/TakagiChanDayo)

![LINE](https://i.imgur.com/2Cc6vJj.png)
