class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions, id: :uuid do |t|
      t.string :name
      t.text :description
      t.integer :amount_in_cents
      t.references :category, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
