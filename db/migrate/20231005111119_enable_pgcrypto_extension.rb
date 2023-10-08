# frozen_string_literal: true

# This will enable the pgcrypto extension in the database (required for Github Actions)
class EnablePgcryptoExtension < ActiveRecord::Migration[7.1]
  def change
    enable_extension 'pgcrypto'
  end
end
