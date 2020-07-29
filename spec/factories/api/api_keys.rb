# frozen_string_literal: true

FactoryBot.define do
  factory :api_keys_payload, class: Hash do
    label { "btcpaygem-spec-#{SecureRandom.hex}" }
    permissions { %w[unrestricted] }

    initialize_with { attributes }
  end
end
