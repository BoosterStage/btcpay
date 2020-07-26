# frozen_string_literal: true

module BtcPay
  module Client
    class Config
      AUTH_TOKEN_TYPE = 'token'
      BASIC_TOKEN_TYPE = 'Basic'

      attr_reader :authorization, :auth_token, :basic_auth_token, :base_url, :user_agent

      def initialize(**kwargs)
        @base_url = load_url(kwargs[:base_url])
        @user_agent = kwargs[:user_agent] || "btcpay_ruby/#{BtcPay::VERSION}"

        load_auth_token(kwargs)
        set_authorization
      end

      def to_h
        {
          auth_token: auth_token,
          basic_auth_token: basic_auth_token,
          base_url: base_url,
          user_agent: user_agent
        }.compact
      end

      private

      def load_url(url)
        base_url = url || ENV['BTCPAY_BASE_URL'].to_s
        uri = URI(base_url)
        return uri.to_s if uri.scheme && uri.host

        raise ArgumentError.new('invalid base_url')
      end

      def load_auth_token(kwargs)
        @auth_token = kwargs[:auth_token] || ENV['BTCPAY_AUTH_TOKEN']
        @basic_auth_token = kwargs[:basic_auth_token] || ENV['BTCPAY_BASIC_AUTH_TOKEN']

        raise ArgumentError.new('auth_token or basic_auth_token required') unless @auth_token || @basic_auth_token
      end

      def set_authorization
        @authorization = if @auth_token
                           "#{AUTH_TOKEN_TYPE} #{@auth_token}"
                         elsif @basic_auth_token
                           "#{BASIC_TOKEN_TYPE} #{@basic_auth_token}"
                         end
      end
    end
  end
end
