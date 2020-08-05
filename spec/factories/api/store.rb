# frozen_string_literal: true

FactoryBot.define do
  factory :store_payload, class: Hash do
    name { "btcpaygem-spec-#{SecureRandom.hex}" }
    website { "https://btcpaygem-spec-#{SecureRandom.hex}.com" }
    speedPolicy { 'MediumSpeed' }
    networkFeeMod { 'Always' }

    initialize_with { attributes }
  end
end
