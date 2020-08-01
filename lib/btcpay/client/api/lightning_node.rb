# frozen_string_literal: true

module BtcPay
  module Client
    module Api
      class LightningNode < Base
        PATH = '/server/lightning/'

        # @see https://docs.btcpayserver.org/API/Greenfield/v1/#tag/Lightning-(Internal-Node)
        def info(crypto_code, **opts)
          client.get(path(crypto_code, 'info'), options: opts)
        end

        # @see https://docs.btcpayserver.org/API/Greenfield/v1/#operation/InternalLightningNodeApi_ConnectToNode
        def connect(crypto_code, payload, **opts)
          client.post(path(crypto_code, 'connect'), payload: payload, options: opts)
        end

        # @see https://docs.btcpayserver.org/API/Greenfield/v1/#operation/InternalLightningNodeApi_GetChannels
        def channels(crypto_code, **opts)
          client.get(path(crypto_code, 'channels'), options: opts)
        end

        alias get_channels channels

        # @see https://docs.btcpayserver.org/API/Greenfield/v1/#operation/InternalLightningNodeApi_OpenChannel
        def open(crypto_code, payload, **opts)
          client.post(path(crypto_code, 'channels'), payload: payload, options: opts)
        end

        alias open_channels open

        # @see https://docs.btcpayserver.org/API/Greenfield/v1/#operation/InternalLightningNodeApi_GetDepositAddress
        def deposit_address(crypto_code, payload, **opts)
          client.post(path(crypto_code, 'address'), payload: payload, options: opts)
        end

        alias address deposit_address

        # @see https://docs.btcpayserver.org/API/Greenfield/v1/#operation/InternalLightningNodeApi_GetInvoice
        def invoice(crypto_code, invoice_id, **opts)
          client.get(path(crypto_code, 'invoices', invoice_id), options: opts)
        end

        alias get_invoice invoice

        # @see https://docs.btcpayserver.org/API/Greenfield/v1/#operation/InternalLightningNodeApi_PayInvoice
        def pay(crypto_code, payload, **opts)
          client.post(path(crypto_code, 'invoices', 'pay'), payload: payload, options: opts)
        end

        alias pay_invoice pay

        # @see https://docs.btcpayserver.org/API/Greenfield/v1/#operation/InternalLightningNodeApi_CreateInvoice
        def create_invoice(crypto_code, payload, **opts)
          client.post(path(crypto_code, 'invoices'), payload: payload, options: opts)
        end

        protected

        def base_path
          PATH
        end
      end
    end
  end
end
