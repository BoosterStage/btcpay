# frozen_string_literal: true

FactoryBot.define do
  factory :client, class: BtcPay::Client::Base do
    config factory: :config

    initialize_with { new(**attributes) }
  end
end
