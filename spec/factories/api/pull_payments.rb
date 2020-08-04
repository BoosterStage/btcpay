# frozen_string_literal: true

FactoryBot.define do
  factory :pull_payments_payout_payload, class: Hash do
    amount { SecureRandom.rand(0.0..0.1) }
    paymentMethod { 'BTC' }
    destination { 'bcrt1q55ktna5ygaf2dzn8qlzvgx4684x3tgnlgsh6az' }

    initialize_with { attributes }
  end
end
