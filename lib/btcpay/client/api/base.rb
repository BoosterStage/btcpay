# frozen_string_literal: true

module BtcPay
  module Client
    module Api
      class Base
        def initialize(client:)
          @client = client
          @logger = @client.logger
        end

        protected

        def base_path
          raise NotImplementedError.new
        end

        def path(*args)
          request_path = args.prepend(base_path.presence).compact.join('/')
          request_path[0].eql?('/') ? request_path : '/' + request_path
        end

        private

        attr_reader :client, :logger
      end
    end
  end
end

require_relative './users'
