# frozen_string_literal: true

FactoryBot.define do
  factory :users_payload, class: Hash do
    email { "btcpaygem-#{SecureRandom.hex}@spec.com" }
    password { 'password' }
    isAdministrator { false }

    initialize_with { attributes }
  end
end
