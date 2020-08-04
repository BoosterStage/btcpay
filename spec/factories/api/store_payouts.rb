# frozen_string_literal: true

FactoryBot.define do
  factory :store_payouts_payload, class: Hash do
    revision { 0 }
    rateRule { 'kraken(BTC_USD)' }

    initialize_with { attributes }
  end
end
