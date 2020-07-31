# frozen_string_literal: true

require_relative '../service'

module BtcPay
  module Client
    module Helpers
      class Base < Client::Service
        require_relative './api_keys'
      end
    end
  end
end
