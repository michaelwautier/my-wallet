# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/signup' do
  subject(:request) { post user_registration_path, params: { user: user_attributes } }

  let(:user_attributes) { attributes_for(:user) }

  context 'with valid params' do
    it 'is successful' do
      request
      expect(response).to be_successful
    end

    it { expect { request }.to change(User, :count).by(1) }
  end

  context 'with invalid params' do
    context 'when email is missing' do
      before { user_attributes[:email] = nil }

      it 'is not successful' do
        request
        expect(response).not_to be_successful
      end

      it { expect { request }.not_to change(User, :count) }
    end

    context 'when password is missing' do
      before { user_attributes[:password] = nil }

      it 'is not successful' do
        request
        expect(response).not_to be_successful
      end

      it { expect { request }.not_to change(User, :count) }
    end

    context 'when first name is missing' do
      before { user_attributes[:first_name] = nil }

      it 'is not successful' do
        request
        expect(response).not_to be_successful
      end

      it { expect { request }.not_to change(User, :count) }
    end

    context 'when last name is missing' do
      before { user_attributes[:last_name] = nil }

      it 'is not successful' do
        request
        expect(response).not_to be_successful
      end

      it { expect { request }.not_to change(User, :count) }
    end
  end
end
