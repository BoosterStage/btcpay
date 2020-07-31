# frozen_string_literal: true

module BtcPay
  module Client
    module Helpers
      class ApiKeys < Helpers::Base
        def authorize
          Authorize.new(client: client)
        end

        protected

        def base_path
          nil
        end

        class Authorize
          PATH = '/api-keys/authorize'

          def initialize(client:)
            @client = client
            @logger = @client.logger
          end

          def html(**opts)
            get(**opts)
          end

          def link(**opts)
            get(skip_request: true, **opts)
          end

          private

          attr_reader :client, :logger

          def get(permissions: [], application_name:, strict: true, selective_stores: false, **opts)
            opts.merge!(
              {
                permissions: Array(permissions),
                applicationName: application_name,
                strict: strict,
                selectiveStores: selective_stores
              }
            )

            skip_request = opts.delete(:skip_request)
            client.get(PATH, options: opts, skip_api_path: true, skip_request: skip_request)
          end
        end
      end
    end
  end
end
