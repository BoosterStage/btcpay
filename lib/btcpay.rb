# frozen_string_literal: true

require 'btcpay/version'

require 'btcpay/client/config'
require 'btcpay/client/base'

module BtcPay
  class Error < StandardError; end

  module_function

  def new(**args)
    config = BtcPay::Client::Config.new(**args)
    BtcPay::Client::Base.new(config: config, **args)
  end
end
