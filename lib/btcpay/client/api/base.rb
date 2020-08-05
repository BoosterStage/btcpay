# frozen_string_literal: true

require_relative '../service'

module BtcPay
  module Client
    module Api
      class Base < Client::Service
        require_relative './api_keys'
        require_relative './health'
        require_relative './lightning_node'
        require_relative './pull_payments'
        require_relative './server'
        require_relative './store'
        require_relative './store_payment_requests'
        require_relative './store_payouts'
        require_relative './store_pull_payments'
        require_relative './users'
      end
    end
  end
end
