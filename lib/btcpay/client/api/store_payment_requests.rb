# frozen_string_literal: true

module BtcPay
  module Client
    module Api
      class StorePaymentRequests < Base
        PATH = '/stores/:store_id/payment-requests'

        # @see https://docs.btcpayserver.org/API/Greenfield/v1/#operation/PaymentRequests_GetPaymentRequests
        def all(store_id, **opts)
          client.get(store_path(store_id), options: opts)
        end

        alias index all

        # @see https://docs.btcpayserver.org/API/Greenfield/v1/#operation/PaymentRequests_CreatePaymentRequest
        def create(store_id, payload, **opts)
          client.post(store_path(store_id), payload: payload, options: opts)
        end

        # @see https://docs.btcpayserver.org/API/Greenfield/v1/#operation/PaymentRequests_GetPaymentRequests
        def get(store_id, request_id, **opts)
          client.get(store_path(store_id, request_id), options: opts)
        end

        alias find get

        # @see https://docs.btcpayserver.org/API/Greenfield/v1/#operation/PaymentRequests_ArchivePaymentRequest
        def delete(store_id, request_id, **opts)
          client.delete(store_path(store_id, request_id), options: opts)
        end

        # @see https://docs.btcpayserver.org/API/Greenfield/v1/#operation/PaymentRequests_ArchivePaymentRequest
        def update(store_id, request_id, payload, **opts)
          client.put(store_path(store_id, request_id), payload: payload, options: opts)
        end

        protected

        def set_base_path
          @base_path = PATH.dup
        end
      end
    end
  end
end
