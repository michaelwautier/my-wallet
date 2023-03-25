class Transaction < ApplicationRecord
  belongs_to :category, optional: true

  validates :name, presence: true
  validates :amount_in_cents, presence: true
end
