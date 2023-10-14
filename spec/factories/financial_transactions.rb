# frozen_string_literal: true

FactoryBot.define do
  factory :financial_transaction do
    account
    reference { Faker::Movie.title }
    amount_cents { rand(1000..100_000) }

    FinancialTransaction.transaction_types.each_key do |transaction_type_key|
      trait transaction_type_key do
        transaction_type { transaction_type_key }
      end
    end
  end
end
