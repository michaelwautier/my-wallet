# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/logout' do
  subject(:request) { delete destroy_user_session_path, headers: { 'Authorization' => authorization } }

  before { request }

  context 'with authorization header' do
    let(:user) { create(:user) }
    let(:sign_in) { post user_session_path, params: { user: { email: user.email, password: 'password' } } }
    let(:authorization) do
      sign_in
      response.headers['authorization']
    end

    it { expect(response).to have_http_status(:ok) }
  end

  context 'without authorization header' do
    let(:authorization) { nil }

    it { expect(response).to have_http_status(:unauthorized) }
  end
end
