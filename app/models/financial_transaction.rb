# frozen_string_literal: true

class FinancialTransaction < ApplicationRecord
  belongs_to :account
  enum transaction_type: { debit: 0, credit: 1 }
end
