# frozen_string_literal: true

module BtcPay
  module Client
    class Service
      def initialize(client:)
        @base_path = set_base_path
        @client = client
        @logger = @client.logger
      end

      protected

      def path(*args)
        request_path = args.prepend(base_path.presence).compact.join('/')
        request_path[0].eql?('/') ? request_path : '/' + request_path
      end

      def store_path(store_id, *args)
        base_path.gsub!(':store_id', store_id)
        path(*args)
      end

      def set_base_path
        raise NotImplementedError.new
      end

      private

      attr_reader :client, :logger, :base_path
    end
  end
end
