# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:financial_transactions).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe '#balance' do
    subject(:account) { create(:account) }

    it 'returns the sum of all financial transactions' do
      [100, 200, 300].each do |amount|
        create(:financial_transaction, :debit, account:, amount_cents: amount)
      end

      expect(account.balance).to eq(600)
    end
  end
end
