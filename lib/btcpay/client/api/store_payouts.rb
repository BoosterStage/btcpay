# frozen_string_literal: true

module BtcPay
  module Client
    module Api
      class StorePayouts < Base
        PATH = '/stores/:store_id/payouts'

        # @see https://docs.btcpayserver.org/API/Greenfield/v1/#/paths/~1api~1v1~1stores~1{storeId}~1payouts~1{payoutId}/post
        def approve(store_id, payout_id, payload, **opts)
          client.post(store_path(store_id, payout_id), payload: payload, options: opts)
        end

        # @see https://docs.btcpayserver.org/API/Greenfield/v1/#tag/Pull-payments-(Management)/paths/~1api~1v1~1stores~1{storeId}~1payouts~1{payoutId}/delete
        def delete(store_id, payout_id, **opts)
          client.delete(store_path(store_id, payout_id), options: opts)
        end

        alias cancel delete

        protected

        def set_base_path
          @base_path = PATH.dup
        end
      end
    end
  end
end
