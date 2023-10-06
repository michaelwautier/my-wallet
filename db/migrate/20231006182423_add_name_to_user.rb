# frozen_string_literal: true

# Add first name and last name to user
class AddNameToUser < ActiveRecord::Migration[7.1]
  def change
    change_table :users, bulk: true do |t|
      t.string :first_name
      t.string :last_name
    end
  end
end
