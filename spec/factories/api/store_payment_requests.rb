# frozen_string_literal: true

FactoryBot.define do
  factory :store_payment_requests_payload, class: Hash do
    amount { SecureRandom.rand(0.0..1.0) }
    title { "btcpaygem-spec-#{SecureRandom.hex}" }
    currency { 'BTC' }

    initialize_with { attributes }
  end
end
