# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/signin' do
  subject(:request) { post user_session_path, params: { user: user_attributes.slice(:email, :password) } }

  let(:user_attributes) { attributes_for(:user) }
  let(:attributes_to_check) { %i[email first_name last_name] }

  before { create(:user, user_attributes) }

  context 'with valid params' do
    it { is_expected.to eq 200 }

    it 'returns the user' do
      request
      user_data = json.dig(:data, :user)
      expect(user_data.slice(*attributes_to_check)).to eq user_attributes.slice(*attributes_to_check)
    end

    it 'returns success message' do
      request
      expect(json[:message]).to eq 'Logged in successfully'
    end
  end

  context 'with invalid params' do
    context 'when email is missing' do
      before { user_attributes[:email] = nil }

      it { is_expected.to eq 401 }

      it 'returns error message' do
        request
        expect(json).to eq 'You need to sign in or sign up before continuing.'
      end
    end

    context 'when password is missing' do
      before { user_attributes[:password] = nil }

      it { is_expected.to eq 401 }

      it 'returns error message' do
        request
        expect(json).to eq 'Invalid Email or password.'
      end
    end
  end
end
