# frozen_string_literal: true

# UserSerializer
class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :first_name, :last_name
end
