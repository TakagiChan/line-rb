module Config
  HOST_URL = "https://legy-backup.line.naver.jp"
  LOGIN_URL = HOST_URL + "/acct/lgn/sq/v1"
  PERMIT_NOTICE_URL = HOST_URL + "/acct/lp/lgn/sq/v1"

  TALK_SERVICE_V4_URL = HOST_URL + "/F4"
  POLL_SERVICE_V4_URL = HOST_URL + "/P4"

  HEADERS = {
      "User-Agent": "Mozilla/5.0 (Windows NT 6.1; rv:49.0) Gecko/20100101 Firefox/49.0",
      "X-Line-Application": "DESKTOPWIN\t6.3.1.2337\tDESKTOP_WIN\t10;SECONDARY",
      "x-lal": "ja_jp",
  }

end
