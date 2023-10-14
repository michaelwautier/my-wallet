# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FinancialTransaction do
  describe 'associations' do
    it { is_expected.to belong_to(:account) }
  end

  describe 'enums' do
    it { is_expected.to define_enum_for(:transaction_type).with_values(debit: 0, credit: 1) }
  end
end
