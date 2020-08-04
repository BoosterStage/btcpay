# frozen_string_literal: true

module BtcPay
  module Client
    module Api
      class Server < Base
        PATH = '/server'

        # @see https://docs.btcpayserver.org/API/Greenfield/v1/#operation/Health_GetHealth
        def info(**opts)
          client.get(path('info'), options: opts)
        end

        protected

        def set_base_path
          @base_path = PATH
        end
      end
    end
  end
end
