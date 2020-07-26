# frozen_string_literal: true

FactoryBot.define do
  factory :users_payload, class: Hash do
    email { 'foo@bar.com' }
    password { 'password' }
    isAdministrator { false }
  end
end
