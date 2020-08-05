# frozen_string_literal: true

module BtcPay
  module Client
    module Api
      class PullPayments < Base
        PATH = 'pull-payments'

        # @see https://docs.btcpayserver.org/API/Greenfield/v1/#tag/Pull-payments-(Public)/paths/~1api~1v1~1pull-payments~1{pullPaymentId}/get
        def get(pull_payment_id, **opts)
          client.get(path(pull_payment_id), options: opts)
        end

        alias find get

        # @see https://docs.btcpayserver.org/API/Greenfield/v1/#tag/Pull-payments-(Public)/paths/~1api~1v1~1pull-payments~1{pullPaymentId}~1payouts/get
        def payouts(pull_payment_id, **opts)
          client.get(path(pull_payment_id, 'payouts'), options: opts)
        end

        # @see https://docs.btcpayserver.org/API/Greenfield/v1/#tag/Pull-payments-(Public)/paths/~1api~1v1~1pull-payments~1{pullPaymentId}~1payouts/post
        def create_payout(pull_payment_id, payload, **opts)
          client.post(path(pull_payment_id, 'payouts'), payload: payload, options: opts)
        end

        protected

        def set_base_path
          @base_path = PATH.dup
        end
      end
    end
  end
end
