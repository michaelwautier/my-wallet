# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

FINANCIAL_TRANSACTIONS_COUNT = 5

user = User.find_or_initialize_by(first_name: 'Michaël', last_name: 'Wautier', email: 'michael@wallet.com')

if user.new_record?
  user.password = 'password'
  user.save!
end

puts "=== Creating account for #{user.email} ==="

account = Account.find_or_create_by!(user:, name: 'Hello Bank!')

puts "=== Creating #{FINANCIAL_TRANSACTIONS_COUNT} transactions for #{account.name} ==="

FINANCIAL_TRANSACTIONS_COUNT.times do
  FinancialTransaction.create!(
    account:,
    reference: "Transaction #{FinancialTransaction.count + 1}",
    amount_cents: rand(1000..100_000),
    transaction_type: FinancialTransaction.transaction_types.keys.sample
  )
end
