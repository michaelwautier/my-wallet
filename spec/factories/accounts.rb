# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    user
    name { Faker::Bank.name }
  end
end
