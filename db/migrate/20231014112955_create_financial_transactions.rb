# frozen_string_literal: true

# Initialize financial transactions
class CreateFinancialTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :financial_transactions, id: :uuid do |t|
      t.references :account, null: false, foreign_key: true, type: :uuid
      t.integer :amount_cents, null: false
      t.string :reference, null: false
      t.integer :transaction_type, null: false, default: 0

      t.timestamps
    end
  end
end
