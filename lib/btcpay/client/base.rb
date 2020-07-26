# frozen_string_literal: true

require 'active_support'
require 'active_support/core_ext/object'
require 'rest_client'

require_relative './result'
require_relative './api/base'

module BtcPay
  module Client
    class Error < RuntimeError
      def initialize(message)
        super(message)
      end
    end

    class Base
      API_PATH = '/api/v1'
      DEFAULT_TIMEOUT = 10

      # @param config [BtcPay::Client::Config]
      # @param logger [Logger]
      # @param timeout [Integer] Defaults to DEFAULT_TIMEOUT
      def initialize(config:, logger: Logger.new(STDOUT), timeout: DEFAULT_TIMEOUT, **_kwargs)
        @config = config
        @logger = logger
        @timeout = timeout
      end

      # GET request
      #
      # @param uri [String]
      # @param options [Hash]
      # @param headers [Hash]
      # @return [Result]
      def get(uri, options: {}, headers: {})
        request(uri, method: :get, options: options, headers: headers)
      end

      # POST request
      #
      # @param uri [String]
      # @param payload [Hash]
      # @param options [Hash]
      # @param headers [Hash]
      # @return [Result]
      def post(uri, payload:, options: {}, headers: {})
        data = payload.is_a?(Hash) ? payload.to_json : payload
        request(uri, method: :post, payload: data, options: options, headers: headers)
      end

      def users
        @users ||= Api::Users.new(client: self, logger: logger)
      end

      private

      attr_reader :config, :logger

      # @return [Hash]
      def default_headers
        {
          'Content-Type' => 'application/json',
          'Accept' => 'application/json',
          'User-Agent' => config.user_agent,
          'Accept-Encoding' => 'deflate, gzip',
          'Authorization' => config.authorization
        }
      end

      # @yield [Result]
      def request(uri, method:, payload: nil, options: {}, headers: {})
        options ||= {}
        headers ||= {}

        url = URI(config.base_url)
        url.path = API_PATH + uri
        url.query = CGI.unescape(options.to_query).presence

        params = {
          method: method,
          url: url.to_s,
          payload: payload,
          headers: default_headers.merge(headers),
          open_timeout: open_timeout,
          timeout: timeout
        }.compact

        response = RestClient::Request.execute(params)

        logger.debug(message: 'GET Request', url: url, options: options, status: response.code)
        result = success?(response.code) ? Result.success(response) : Result.failed(response)

        logger.warn(error: 'Request Error', code: result.code, body: result.raw) if result.failure?
        result
      rescue ::RestClient::GatewayTimeout
        raise Error.new('Gateway timeout')
      rescue ::RestClient::RequestTimeout
        raise Error.new('Request timeout')
      rescue ::RestClient::Exception => e
        handle_error(e)
      end

      # Handle errors
      # @param error [Error]
      # @return [Result]
      def handle_error(error)
        logger.error(error: 'Request Exception', code: error.response.code, message: error.message)

        Result.failed(response)
      end

      # @return [Integer]
      def open_timeout
        @open_timeout || DEFAULT_TIMEOUT
      end

      # @return [Integer]
      def timeout
        @timeout || DEFAULT_TIMEOUT
      end

      def success?(response_code)
        response_code.in?(200..299)
      end
    end
  end
end
