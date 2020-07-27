# frozen_string_literal: true

FactoryBot.define do
  factory :config, class: BtcPay::Client::Config do
    base_url { 'http://localhost:49392' }

    auth_token # default trait

    initialize_with { new(**attributes) }

    trait :auth_token do
      auth_token { '9133b8ef3ae9a4b7f2d9a6efef1d5cf738067c68' }
      basic_auth_token { nil }
    end

    trait :basic_auth_token do
      auth_token { nil }
      basic_auth_token { 'G7Uvk0VV7BWQQI7LrihMnDGhEnR7kopW0PRoli77Lyo' }
    end
  end
end
