# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'associations' do
    it { is_expected.to have_many(:accounts).dependent(:destroy) }
    it { is_expected.to have_many(:financial_transactions).through(:accounts) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  describe '#full_name' do
    subject(:user) { described_class.new(attributes) }

    let(:attributes) { attributes_for(:user) }

    it 'returns the full name' do
      expect(user.full_name).to eq("#{attributes[:first_name]} #{attributes[:last_name]}".strip)
    end
  end
end
