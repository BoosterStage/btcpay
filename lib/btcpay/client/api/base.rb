# frozen_string_literal: true

require_relative '../service'

module BtcPay
  module Client
    module Api
      class Base < Client::Service
        require_relative './api_keys'
        require_relative './health'
        require_relative './users'
      end
    end
  end
end
