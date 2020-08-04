# frozen_string_literal: true

module BtcPay
  module Client
    module Api
      class Users < Base
        PATH = '/users'

        # @see https://docs.btcpayserver.org/API/Greenfield/v1/#operation/Users_GetCurrentUser
        def me(**opts)
          client.get(path('me'), options: opts)
        end

        alias get me

        # @see https://docs.btcpayserver.org/API/Greenfield/v1/#tag/Users/paths/~1api~1v1~1users/post
        def create(payload, **opts)
          client.post(path, payload: payload, options: opts)
        end

        protected

        def set_base_path
          @base_path = PATH
        end
      end
    end
  end
end
