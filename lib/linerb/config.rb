module Config
  HOST_URL = "https://legy-jp-addr.line.naver.jp"
  LOGIN_URL = HOST_URL + "/acct/lgn/sq/v1"
  PERMIT_NOTICE_URL = HOST_URL + "/acct/lp/lgn/sq/v1"

  TALK_SERVICE_V4_URL = HOST_URL + "/S4"
  POLL_SERVICE_V4_URL = HOST_URL + "/P4"

  HEADERS = {
      "User-Agent": "LLA/2.11.1 Nexus 5X 10",
      "X-Line-Application": "ANDROIDLITE\t2.11.1\tAndroid OS\t10.0;SECONDARY",
      "x-lal": "ja_jp",
  }
end
