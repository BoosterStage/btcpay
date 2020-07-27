# frozen_string_literal: true

FactoryBot.define do
  factory :users_payload, class: Hash do
    email { "btcpaygem-#{SecureRandom.hex}@spec.com" }
    password { 'password' }
    isAdministrator { false }

    initialize_with do
      user = {}
      attributes.each { |k, v| user[k] = v }
      user
    end
  end
end
