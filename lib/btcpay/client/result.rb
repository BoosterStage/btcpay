# frozen_string_literal: true

require 'active_support/core_ext/hash/indifferent_access'
require 'multi_json'

module BtcPay
  module Client
    ##
    # Status object to capture result from an HTTP request
    #
    # Gives callers context of the result and allows them to
    # implement successful strategies to handle success/failure
    class Result
      def self.success(response)
        new(:success, response)
      end

      def self.failed(response)
        new(:failed, response)
      end

      attr_reader :body, :code, :headers, :raw, :status

      def initialize(status, response)
        @raw = raw_parse(response.body)

        @body = rubify_body
        @code = response.code
        @headers = response.headers # e.g. "Content-Type" will become :content_type.
        @status = status
      end

      def success?
        status == :success
      end

      def failure?
        !success?
      end

      def to_h
        {
          status: status,
          headers: headers,
          code: code,
          body: body
        }
      end

      alias to_hash to_h

      private

      def method_missing(method, *args, &blk)
        to_h.send(method, *args, &blk) || super
      end

      def respond_to_missing?(method, include_private = false)
        to_h.respond_to?(method) || super
      end

      # @param body [JSON] Raw JSON body
      def raw_parse(body)
        MultiJson.load(body).with_indifferent_access
      rescue StandardError => e
        raise ResponseBodyParseError.new(error: 'JSON parse error', message: e.message, body: body)
      end

      def rubify_body
        raw.deep_transform_keys { |key| key.to_s.underscore }.with_indifferent_access
      end

      class ResponseBodyParseError < StandardError; end
    end
  end
end
