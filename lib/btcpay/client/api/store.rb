# frozen_string_literal: true

module BtcPay
  module Client
    module Api
      class Store < Base
        PATH = '/stores'

        # @see https://docs.btcpayserver.org/API/Greenfield/v1/#operation/Stores_GetStores
        def all(**opts)
          client.get(path, options: opts)
        end

        alias stores all
        alias index all

        # @see https://docs.btcpayserver.org/API/Greenfield/v1/#tag/Stores/paths/~1api~1v1~1stores/post
        def create(payload, **opts)
          client.post(path, payload: payload, options: opts)
        end

        # @see https://docs.btcpayserver.org/API/Greenfield/v1/#operation/Stores_GetStore
        def get(store_id, **opts)
          client.get(path(store_id), options: opts)
        end

        # @see https://docs.btcpayserver.org/API/Greenfield/v1/#operation/Stores_UpdateStore
        def update(store_id, payload, **opts)
          client.put(path(store_id), payload: payload, options: opts)
        end

        alias put update

        # @see https://docs.btcpayserver.org/API/Greenfield/v1/#tag/Stores/paths/~1api~1v1~1stores~1{storeId}/delete
        def delete(store_id, **opts)
          client.delete(path(store_id), options: opts)
        end

        ##
        # services
        ##
        def payment_requests
          @payment_requests ||= Api::StorePaymentRequests.new(client: client)
        end

        def payouts
          @payouts ||= Api::StorePayouts.new(client: client)
        end

        def pull_payments
          @pull_payments ||= Api::StorePullPayments.new(client: client)
        end

        protected

        def set_base_path
          @base_path = PATH
        end
      end
    end
  end
end
