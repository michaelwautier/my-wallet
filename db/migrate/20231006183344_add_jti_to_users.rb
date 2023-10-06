# frozen_string_literal: true

# Add jti to users https://sdrmike.medium.com/rails-7-api-only-app-with-devise-and-jwt-for-authentication-1397211fb97c#:~:text=rails%20g%20migration%20addJtiToUsers%20jti%3Astring%3Aindex%3Aunique
class AddJtiToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :jti, :string, null: false, default: ''
    add_index :users, :jti, unique: true
  end
end
