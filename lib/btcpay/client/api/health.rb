# frozen_string_literal: true

module BtcPay
  module Client
    module Api
      class Health < Base
        PATH = '/health'

        # @see https://docs.btcpayserver.org/API/Greenfield/v1/#operation/Health_GetHealth
        def status(**opts)
          client.get(path, options: opts)
        end

        alias get status
        alias info status

        protected

        def set_base_path
          @base_path = PATH
        end
      end
    end
  end
end
