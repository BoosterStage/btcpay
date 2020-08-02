# frozen_string_literal: true

FactoryBot.define do
  factory :store_pull_payments_payload, class: Hash do
    name { "btcpaygem-spec-#{SecureRandom.hex}" }
    amount { SecureRandom.rand(0.0..1.0) }
    currency { 'BTC' }
    paymentMethods { %w[BTC] }

    initialize_with { attributes }
  end
end
