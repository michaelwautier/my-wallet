# frozen_string_literal: true

module Users
  # Users::SessionsController from Devise
  class SessionsController < Devise::SessionsController
    respond_to :json

    private

    def respond_with(current_user, _opts = {})
      render json: {
        message: 'Logged in successfully',
        data: { user: UserSerializer.new(current_user).serializable_hash.dig(:data, :attributes) }
      }, status: :ok
    end

    def respond_to_on_destroy
      render_unauthorized_response and return if authorization_header.blank?

      jwt_payload = JWT.decode(authorization_header.split.last,
                               Rails.application.credentials.devise_jwt_secret_key).first
      current_user = User.find_by(id: jwt_payload['sub'], jti: jwt_payload['jti'])

      if current_user
        render json: { message: 'Logged out successfully' }, status: :ok
      else
        render_unauthorized_response
      end
    end

    def authorization_header
      @authorization_header ||= request.headers['Authorization']
    end

    def render_unauthorized_response
      render json: { message: "Couldn't find an active session" }, status: :unauthorized
    end
  end
end
