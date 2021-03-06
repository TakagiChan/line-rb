#
# Autogenerated by Thrift Compiler (0.13.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require_relative 'takagi_chan_types'

module AccountAuthFactorEapConnectService
  class Client
    include ::Thrift::Client

    def connectEapAccount(request)
      send_connectEapAccount(request)
      return recv_connectEapAccount()
    end

    def send_connectEapAccount(request)
      send_message('connectEapAccount', ConnectEapAccount_args, :request => request)
    end

    def recv_connectEapAccount()
      result = receive_message(ConnectEapAccount_result)
      return result.success unless result.success.nil?
      raise result.e unless result.e.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'connectEapAccount failed: unknown result')
    end

    def disconnectEapAccount(request)
      send_disconnectEapAccount(request)
      return recv_disconnectEapAccount()
    end

    def send_disconnectEapAccount(request)
      send_message('disconnectEapAccount', DisconnectEapAccount_args, :request => request)
    end

    def recv_disconnectEapAccount()
      result = receive_message(DisconnectEapAccount_result)
      return result.success unless result.success.nil?
      raise result.e unless result.e.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'disconnectEapAccount failed: unknown result')
    end

    def openSession(request)
      send_openSession(request)
      return recv_openSession()
    end

    def send_openSession(request)
      send_message('openSession', OpenSession_args, :request => request)
    end

    def recv_openSession()
      result = receive_message(OpenSession_result)
      return result.success unless result.success.nil?
      raise result.e unless result.e.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'openSession failed: unknown result')
    end

    def verifyEapLogin(request)
      send_verifyEapLogin(request)
      return recv_verifyEapLogin()
    end

    def send_verifyEapLogin(request)
      send_message('verifyEapLogin', VerifyEapLogin_args, :request => request)
    end

    def recv_verifyEapLogin()
      result = receive_message(VerifyEapLogin_result)
      return result.success unless result.success.nil?
      raise result.e unless result.e.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'verifyEapLogin failed: unknown result')
    end

  end

  class Processor
    include ::Thrift::Processor

    def process_connectEapAccount(seqid, iprot, oprot)
      args = read_args(iprot, ConnectEapAccount_args)
      result = ConnectEapAccount_result.new()
      begin
        result.success = @handler.connectEapAccount(args.request)
      rescue ::AccountEapConnectException => e
        result.e = e
      end
      write_result(result, oprot, 'connectEapAccount', seqid)
    end

    def process_disconnectEapAccount(seqid, iprot, oprot)
      args = read_args(iprot, DisconnectEapAccount_args)
      result = DisconnectEapAccount_result.new()
      begin
        result.success = @handler.disconnectEapAccount(args.request)
      rescue ::AccountEapConnectException => e
        result.e = e
      end
      write_result(result, oprot, 'disconnectEapAccount', seqid)
    end

    def process_openSession(seqid, iprot, oprot)
      args = read_args(iprot, OpenSession_args)
      result = OpenSession_result.new()
      begin
        result.success = @handler.openSession(args.request)
      rescue ::AuthException => e
        result.e = e
      end
      write_result(result, oprot, 'openSession', seqid)
    end

    def process_verifyEapLogin(seqid, iprot, oprot)
      args = read_args(iprot, VerifyEapLogin_args)
      result = VerifyEapLogin_result.new()
      begin
        result.success = @handler.verifyEapLogin(args.request)
      rescue ::AccountEapConnectException => e
        result.e = e
      end
      write_result(result, oprot, 'verifyEapLogin', seqid)
    end

  end

  # HELPER FUNCTIONS AND STRUCTURES

  class ConnectEapAccount_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    REQUEST = 1

    FIELDS = {
      REQUEST => {:type => ::Thrift::Types::STRUCT, :name => 'request', :class => ::ConnectEapAccountRequest}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class ConnectEapAccount_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    E = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => ::ConnectEapAccountResponse},
      E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::AccountEapConnectException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class DisconnectEapAccount_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    REQUEST = 1

    FIELDS = {
      REQUEST => {:type => ::Thrift::Types::STRUCT, :name => 'request', :class => ::DisconnectEapAccountRequest}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class DisconnectEapAccount_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    E = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => ::DisconnectEapAccountResponse},
      E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::AccountEapConnectException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class OpenSession_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    REQUEST = 1

    FIELDS = {
      REQUEST => {:type => ::Thrift::Types::STRUCT, :name => 'request', :class => ::OpenSession_AAFECS_Request}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class OpenSession_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    E = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRING, :name => 'success'},
      E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::AuthException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class VerifyEapLogin_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    REQUEST = 1

    FIELDS = {
      REQUEST => {:type => ::Thrift::Types::STRUCT, :name => 'request', :class => ::VerifyEapLoginRequest}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class VerifyEapLogin_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    E = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => ::VerifyEapLoginResponse},
      E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::AccountEapConnectException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

end

