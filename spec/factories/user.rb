# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name { 'Doe' }
    email { "#{first_name}.#{last_name}@example.com".downcase }
    password { 'password' }
  end
end
