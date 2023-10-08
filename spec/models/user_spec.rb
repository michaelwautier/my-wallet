# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  subject(:user) { described_class.new(attributes) }

  let(:attributes) { attributes_for(:user) }

  context 'with valid attributes' do
    it { is_expected.to be_valid }
  end

  context 'with invalid attributes' do
    context 'without email' do
      it 'is not valid' do
        user.email = nil
        expect(user).not_to be_valid
      end
    end

    context 'without password' do
      it 'is not valid' do
        user.password = nil
        expect(user).not_to be_valid
      end
    end

    context 'without first_name' do
      it 'is not valid' do
        user.first_name = nil
        expect(user).not_to be_valid
      end
    end

    context 'without last_name' do
      it 'is not valid' do
        user.last_name = nil
        expect(user).not_to be_valid
      end
    end
  end
end
