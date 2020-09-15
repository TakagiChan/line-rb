#
# Autogenerated by Thrift Compiler (0.13.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require_relative 'takagi_chan_types'

module ChannelService
  class Client
    include ::Thrift::Client

    def getApprovedChannels(lastSynced, locale)
      send_getApprovedChannels(lastSynced, locale)
      return recv_getApprovedChannels()
    end

    def send_getApprovedChannels(lastSynced, locale)
      send_message('getApprovedChannels', GetApprovedChannels_args, :lastSynced => lastSynced, :locale => locale)
    end

    def recv_getApprovedChannels()
      result = receive_message(GetApprovedChannels_result)
      return result.success unless result.success.nil?
      raise result.e unless result.e.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'getApprovedChannels failed: unknown result')
    end

    def getChannelSettings()
      send_getChannelSettings()
      return recv_getChannelSettings()
    end

    def send_getChannelSettings()
      send_message('getChannelSettings', GetChannelSettings_args)
    end

    def recv_getChannelSettings()
      result = receive_message(GetChannelSettings_result)
      return result.success unless result.success.nil?
      raise result.e unless result.e.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'getChannelSettings failed: unknown result')
    end

    def getReturnUrlWithRequestTokenForAutoLogin(webLoginRequest)
      send_getReturnUrlWithRequestTokenForAutoLogin(webLoginRequest)
      return recv_getReturnUrlWithRequestTokenForAutoLogin()
    end

    def send_getReturnUrlWithRequestTokenForAutoLogin(webLoginRequest)
      send_message('getReturnUrlWithRequestTokenForAutoLogin', GetReturnUrlWithRequestTokenForAutoLogin_args, :webLoginRequest => webLoginRequest)
    end

    def recv_getReturnUrlWithRequestTokenForAutoLogin()
      result = receive_message(GetReturnUrlWithRequestTokenForAutoLogin_result)
      return result.success unless result.success.nil?
      raise result.e unless result.e.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'getReturnUrlWithRequestTokenForAutoLogin failed: unknown result')
    end

    def getWebLoginDisallowedUrl(webLoginRequest)
      send_getWebLoginDisallowedUrl(webLoginRequest)
      return recv_getWebLoginDisallowedUrl()
    end

    def send_getWebLoginDisallowedUrl(webLoginRequest)
      send_message('getWebLoginDisallowedUrl', GetWebLoginDisallowedUrl_args, :webLoginRequest => webLoginRequest)
    end

    def recv_getWebLoginDisallowedUrl()
      result = receive_message(GetWebLoginDisallowedUrl_result)
      return result.success unless result.success.nil?
      raise result.e unless result.e.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'getWebLoginDisallowedUrl failed: unknown result')
    end

    def updateChannelSettings(channelSettings)
      send_updateChannelSettings(channelSettings)
      recv_updateChannelSettings()
    end

    def send_updateChannelSettings(channelSettings)
      send_message('updateChannelSettings', UpdateChannelSettings_args, :channelSettings => channelSettings)
    end

    def recv_updateChannelSettings()
      result = receive_message(UpdateChannelSettings_result)
      raise result.e unless result.e.nil?
      return
    end

    def approveChannelAndIssueChannelToken(channelId)
      send_approveChannelAndIssueChannelToken(channelId)
      return recv_approveChannelAndIssueChannelToken()
    end

    def send_approveChannelAndIssueChannelToken(channelId)
      send_message('approveChannelAndIssueChannelToken', ApproveChannelAndIssueChannelToken_args, :channelId => channelId)
    end

    def recv_approveChannelAndIssueChannelToken()
      result = receive_message(ApproveChannelAndIssueChannelToken_result)
      return result.success unless result.success.nil?
      raise result.e unless result.e.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'approveChannelAndIssueChannelToken failed: unknown result')
    end

    def getChannelInfo(channelId, locale)
      send_getChannelInfo(channelId, locale)
      return recv_getChannelInfo()
    end

    def send_getChannelInfo(channelId, locale)
      send_message('getChannelInfo', GetChannelInfo_args, :channelId => channelId, :locale => locale)
    end

    def recv_getChannelInfo()
      result = receive_message(GetChannelInfo_result)
      return result.success unless result.success.nil?
      raise result.e unless result.e.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'getChannelInfo failed: unknown result')
    end

    def getChannelNotificationSettings(locale)
      send_getChannelNotificationSettings(locale)
      return recv_getChannelNotificationSettings()
    end

    def send_getChannelNotificationSettings(locale)
      send_message('getChannelNotificationSettings', GetChannelNotificationSettings_args, :locale => locale)
    end

    def recv_getChannelNotificationSettings()
      result = receive_message(GetChannelNotificationSettings_result)
      return result.success unless result.success.nil?
      raise result.e unless result.e.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'getChannelNotificationSettings failed: unknown result')
    end

    def getCommonDomains(lastSynced)
      send_getCommonDomains(lastSynced)
      return recv_getCommonDomains()
    end

    def send_getCommonDomains(lastSynced)
      send_message('getCommonDomains', GetCommonDomains_args, :lastSynced => lastSynced)
    end

    def recv_getCommonDomains()
      result = receive_message(GetCommonDomains_result)
      return result.success unless result.success.nil?
      raise result.e unless result.e.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'getCommonDomains failed: unknown result')
    end

    def getUpdatedChannelIds(channelIds)
      send_getUpdatedChannelIds(channelIds)
      return recv_getUpdatedChannelIds()
    end

    def send_getUpdatedChannelIds(channelIds)
      send_message('getUpdatedChannelIds', GetUpdatedChannelIds_args, :channelIds => channelIds)
    end

    def recv_getUpdatedChannelIds()
      result = receive_message(GetUpdatedChannelIds_result)
      return result.success unless result.success.nil?
      raise result.e unless result.e.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'getUpdatedChannelIds failed: unknown result')
    end

    def issueChannelToken(channelId)
      send_issueChannelToken(channelId)
      return recv_issueChannelToken()
    end

    def send_issueChannelToken(channelId)
      send_message('issueChannelToken', IssueChannelToken_args, :channelId => channelId)
    end

    def recv_issueChannelToken()
      result = receive_message(IssueChannelToken_result)
      return result.success unless result.success.nil?
      raise result.e unless result.e.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'issueChannelToken failed: unknown result')
    end

    def issueRequestTokenWithAuthScheme(channelId, otpId, authScheme, returnUrl)
      send_issueRequestTokenWithAuthScheme(channelId, otpId, authScheme, returnUrl)
      return recv_issueRequestTokenWithAuthScheme()
    end

    def send_issueRequestTokenWithAuthScheme(channelId, otpId, authScheme, returnUrl)
      send_message('issueRequestTokenWithAuthScheme', IssueRequestTokenWithAuthScheme_args, :channelId => channelId, :otpId => otpId, :authScheme => authScheme, :returnUrl => returnUrl)
    end

    def recv_issueRequestTokenWithAuthScheme()
      result = receive_message(IssueRequestTokenWithAuthScheme_result)
      return result.success unless result.success.nil?
      raise result.e unless result.e.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'issueRequestTokenWithAuthScheme failed: unknown result')
    end

    def reserveCoinUse(request, locale)
      send_reserveCoinUse(request, locale)
      return recv_reserveCoinUse()
    end

    def send_reserveCoinUse(request, locale)
      send_message('reserveCoinUse', ReserveCoinUse_args, :request => request, :locale => locale)
    end

    def recv_reserveCoinUse()
      result = receive_message(ReserveCoinUse_result)
      return result.success unless result.success.nil?
      raise result.e unless result.e.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'reserveCoinUse failed: unknown result')
    end

    def updateChannelNotificationSetting(setting)
      send_updateChannelNotificationSetting(setting)
      recv_updateChannelNotificationSetting()
    end

    def send_updateChannelNotificationSetting(setting)
      send_message('updateChannelNotificationSetting', UpdateChannelNotificationSetting_args, :setting => setting)
    end

    def recv_updateChannelNotificationSetting()
      result = receive_message(UpdateChannelNotificationSetting_result)
      raise result.e unless result.e.nil?
      return
    end

  end

  class Processor
    include ::Thrift::Processor

    def process_getApprovedChannels(seqid, iprot, oprot)
      args = read_args(iprot, GetApprovedChannels_args)
      result = GetApprovedChannels_result.new()
      begin
        result.success = @handler.getApprovedChannels(args.lastSynced, args.locale)
      rescue ::ChannelException => e
        result.e = e
      end
      write_result(result, oprot, 'getApprovedChannels', seqid)
    end

    def process_getChannelSettings(seqid, iprot, oprot)
      args = read_args(iprot, GetChannelSettings_args)
      result = GetChannelSettings_result.new()
      begin
        result.success = @handler.getChannelSettings()
      rescue ::ChannelException => e
        result.e = e
      end
      write_result(result, oprot, 'getChannelSettings', seqid)
    end

    def process_getReturnUrlWithRequestTokenForAutoLogin(seqid, iprot, oprot)
      args = read_args(iprot, GetReturnUrlWithRequestTokenForAutoLogin_args)
      result = GetReturnUrlWithRequestTokenForAutoLogin_result.new()
      begin
        result.success = @handler.getReturnUrlWithRequestTokenForAutoLogin(args.webLoginRequest)
      rescue ::ChannelException => e
        result.e = e
      end
      write_result(result, oprot, 'getReturnUrlWithRequestTokenForAutoLogin', seqid)
    end

    def process_getWebLoginDisallowedUrl(seqid, iprot, oprot)
      args = read_args(iprot, GetWebLoginDisallowedUrl_args)
      result = GetWebLoginDisallowedUrl_result.new()
      begin
        result.success = @handler.getWebLoginDisallowedUrl(args.webLoginRequest)
      rescue ::ChannelException => e
        result.e = e
      end
      write_result(result, oprot, 'getWebLoginDisallowedUrl', seqid)
    end

    def process_updateChannelSettings(seqid, iprot, oprot)
      args = read_args(iprot, UpdateChannelSettings_args)
      result = UpdateChannelSettings_result.new()
      begin
        @handler.updateChannelSettings(args.channelSettings)
      rescue ::ChannelException => e
        result.e = e
      end
      write_result(result, oprot, 'updateChannelSettings', seqid)
    end

    def process_approveChannelAndIssueChannelToken(seqid, iprot, oprot)
      args = read_args(iprot, ApproveChannelAndIssueChannelToken_args)
      result = ApproveChannelAndIssueChannelToken_result.new()
      begin
        result.success = @handler.approveChannelAndIssueChannelToken(args.channelId)
      rescue ::ChannelException => e
        result.e = e
      end
      write_result(result, oprot, 'approveChannelAndIssueChannelToken', seqid)
    end

    def process_getChannelInfo(seqid, iprot, oprot)
      args = read_args(iprot, GetChannelInfo_args)
      result = GetChannelInfo_result.new()
      begin
        result.success = @handler.getChannelInfo(args.channelId, args.locale)
      rescue ::ChannelException => e
        result.e = e
      end
      write_result(result, oprot, 'getChannelInfo', seqid)
    end

    def process_getChannelNotificationSettings(seqid, iprot, oprot)
      args = read_args(iprot, GetChannelNotificationSettings_args)
      result = GetChannelNotificationSettings_result.new()
      begin
        result.success = @handler.getChannelNotificationSettings(args.locale)
      rescue ::ChannelException => e
        result.e = e
      end
      write_result(result, oprot, 'getChannelNotificationSettings', seqid)
    end

    def process_getCommonDomains(seqid, iprot, oprot)
      args = read_args(iprot, GetCommonDomains_args)
      result = GetCommonDomains_result.new()
      begin
        result.success = @handler.getCommonDomains(args.lastSynced)
      rescue ::ChannelException => e
        result.e = e
      end
      write_result(result, oprot, 'getCommonDomains', seqid)
    end

    def process_getUpdatedChannelIds(seqid, iprot, oprot)
      args = read_args(iprot, GetUpdatedChannelIds_args)
      result = GetUpdatedChannelIds_result.new()
      begin
        result.success = @handler.getUpdatedChannelIds(args.channelIds)
      rescue ::ChannelException => e
        result.e = e
      end
      write_result(result, oprot, 'getUpdatedChannelIds', seqid)
    end

    def process_issueChannelToken(seqid, iprot, oprot)
      args = read_args(iprot, IssueChannelToken_args)
      result = IssueChannelToken_result.new()
      begin
        result.success = @handler.issueChannelToken(args.channelId)
      rescue ::ChannelException => e
        result.e = e
      end
      write_result(result, oprot, 'issueChannelToken', seqid)
    end

    def process_issueRequestTokenWithAuthScheme(seqid, iprot, oprot)
      args = read_args(iprot, IssueRequestTokenWithAuthScheme_args)
      result = IssueRequestTokenWithAuthScheme_result.new()
      begin
        result.success = @handler.issueRequestTokenWithAuthScheme(args.channelId, args.otpId, args.authScheme, args.returnUrl)
      rescue ::ChannelException => e
        result.e = e
      end
      write_result(result, oprot, 'issueRequestTokenWithAuthScheme', seqid)
    end

    def process_reserveCoinUse(seqid, iprot, oprot)
      args = read_args(iprot, ReserveCoinUse_args)
      result = ReserveCoinUse_result.new()
      begin
        result.success = @handler.reserveCoinUse(args.request, args.locale)
      rescue ::ChannelException => e
        result.e = e
      end
      write_result(result, oprot, 'reserveCoinUse', seqid)
    end

    def process_updateChannelNotificationSetting(seqid, iprot, oprot)
      args = read_args(iprot, UpdateChannelNotificationSetting_args)
      result = UpdateChannelNotificationSetting_result.new()
      begin
        @handler.updateChannelNotificationSetting(args.setting)
      rescue ::ChannelException => e
        result.e = e
      end
      write_result(result, oprot, 'updateChannelNotificationSetting', seqid)
    end

  end

  # HELPER FUNCTIONS AND STRUCTURES

  class GetApprovedChannels_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    LASTSYNCED = 2
    LOCALE = 3

    FIELDS = {
      LASTSYNCED => {:type => ::Thrift::Types::I64, :name => 'lastSynced'},
      LOCALE => {:type => ::Thrift::Types::STRING, :name => 'locale'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class GetApprovedChannels_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    E = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => ::ApprovedChannelInfos},
      E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::ChannelException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class GetChannelSettings_args
    include ::Thrift::Struct, ::Thrift::Struct_Union

    FIELDS = {

    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class GetChannelSettings_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    E = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => ::ChannelSettings},
      E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::ChannelException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class GetReturnUrlWithRequestTokenForAutoLogin_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    WEBLOGINREQUEST = 2

    FIELDS = {
      WEBLOGINREQUEST => {:type => ::Thrift::Types::STRUCT, :name => 'webLoginRequest', :class => ::WebLoginRequest}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class GetReturnUrlWithRequestTokenForAutoLogin_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    E = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => ::WebLoginResponse},
      E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::ChannelException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class GetWebLoginDisallowedUrl_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    WEBLOGINREQUEST = 2

    FIELDS = {
      WEBLOGINREQUEST => {:type => ::Thrift::Types::STRUCT, :name => 'webLoginRequest', :class => ::WebLoginRequest}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class GetWebLoginDisallowedUrl_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    E = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => ::WebLoginResponse},
      E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::ChannelException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class UpdateChannelSettings_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    CHANNELSETTINGS = 1

    FIELDS = {
      CHANNELSETTINGS => {:type => ::Thrift::Types::STRUCT, :name => 'channelSettings', :class => ::ChannelSettings}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class UpdateChannelSettings_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    E = 1

    FIELDS = {
      E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::ChannelException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class ApproveChannelAndIssueChannelToken_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    CHANNELID = 1

    FIELDS = {
      CHANNELID => {:type => ::Thrift::Types::STRING, :name => 'channelId'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class ApproveChannelAndIssueChannelToken_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    E = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => ::ChannelToken},
      E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::ChannelException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class GetChannelInfo_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    CHANNELID = 2
    LOCALE = 3

    FIELDS = {
      CHANNELID => {:type => ::Thrift::Types::STRING, :name => 'channelId'},
      LOCALE => {:type => ::Thrift::Types::STRING, :name => 'locale'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class GetChannelInfo_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    E = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => ::ChannelInfo},
      E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::ChannelException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class GetChannelNotificationSettings_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    LOCALE = 1

    FIELDS = {
      LOCALE => {:type => ::Thrift::Types::STRING, :name => 'locale'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class GetChannelNotificationSettings_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    E = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::LIST, :name => 'success', :element => {:type => ::Thrift::Types::STRUCT, :class => ::ChannelNotificationSetting}},
      E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::ChannelException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class GetCommonDomains_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    LASTSYNCED = 1

    FIELDS = {
      LASTSYNCED => {:type => ::Thrift::Types::I64, :name => 'lastSynced'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class GetCommonDomains_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    E = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => ::ChannelDomains},
      E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::ChannelException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class GetUpdatedChannelIds_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    CHANNELIDS = 1

    FIELDS = {
      CHANNELIDS => {:type => ::Thrift::Types::LIST, :name => 'channelIds', :element => {:type => ::Thrift::Types::STRUCT, :class => ::ChannelIdWithLastUpdated}}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class GetUpdatedChannelIds_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    E = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::LIST, :name => 'success', :element => {:type => ::Thrift::Types::STRING}},
      E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::ChannelException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class IssueChannelToken_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    CHANNELID = 1

    FIELDS = {
      CHANNELID => {:type => ::Thrift::Types::STRING, :name => 'channelId'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class IssueChannelToken_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    E = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => ::ChannelToken},
      E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::ChannelException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class IssueRequestTokenWithAuthScheme_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    CHANNELID = 1
    OTPID = 2
    AUTHSCHEME = 3
    RETURNURL = 4

    FIELDS = {
      CHANNELID => {:type => ::Thrift::Types::STRING, :name => 'channelId'},
      OTPID => {:type => ::Thrift::Types::STRING, :name => 'otpId'},
      AUTHSCHEME => {:type => ::Thrift::Types::LIST, :name => 'authScheme', :element => {:type => ::Thrift::Types::STRING}},
      RETURNURL => {:type => ::Thrift::Types::STRING, :name => 'returnUrl'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class IssueRequestTokenWithAuthScheme_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    E = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => ::RequestTokenResponse},
      E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::ChannelException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class ReserveCoinUse_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    REQUEST = 2
    LOCALE = 3

    FIELDS = {
      REQUEST => {:type => ::Thrift::Types::STRUCT, :name => 'request', :class => ::CoinUseReservation},
      LOCALE => {:type => ::Thrift::Types::STRING, :name => 'locale'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class ReserveCoinUse_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    E = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRING, :name => 'success'},
      E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::ChannelException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class UpdateChannelNotificationSetting_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SETTING = 1

    FIELDS = {
      SETTING => {:type => ::Thrift::Types::LIST, :name => 'setting', :element => {:type => ::Thrift::Types::STRUCT, :class => ::ChannelNotificationSetting}}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class UpdateChannelNotificationSetting_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    E = 1

    FIELDS = {
      E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::ChannelException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

end

