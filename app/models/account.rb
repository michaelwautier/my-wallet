# frozen_string_literal: true

class Account < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :financial_transactions, dependent: :destroy

  def balance
    financial_transactions.debit.sum(:amount_cents) - financial_transactions.credit.sum(:amount_cents)
  end
end
