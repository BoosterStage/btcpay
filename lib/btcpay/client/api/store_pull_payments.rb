# frozen_string_literal: true

module BtcPay
  module Client
    module Api
      class StorePullPayments < Base
        PATH = '/stores/:store_id/pull-payments'

        # @see https://docs.btcpayserver.org/API/Greenfield/v1/#tag/Pull-payments-(Management)/paths/~1api~1v1~1stores~1{storeId}~1pull-payments/get
        def all(store_id, **opts)
          client.get(store_path(store_id), options: opts)
        end

        alias index all

        # @see https://docs.btcpayserver.org/API/Greenfield/v1/#operation/PaymentRequests_CreatePaymentRequest
        def create(store_id, payload, **opts)
          client.post(store_path(store_id), payload: payload, options: opts)
        end

        # @see https://docs.btcpayserver.org/API/Greenfield/v1/#tag/Pull-payments-(Management)/paths/~1api~1v1~1stores~1{storeId}~1pull-payments~1{pullPaymentId}/delete
        def delete(store_id, pull_payment_id, **opts)
          client.delete(store_path(store_id, pull_payment_id), options: opts)
        end

        protected

        def set_base_path
          @base_path = PATH.dup
        end
      end
    end
  end
end
