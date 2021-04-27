class CreateLineItems < ActiveRecord::Migration[6.1]
  def change
    create_table :line_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.integer :quantity, null: false
      t.integer :each_price_cents, null: false

      t.timestamps
    end
    add_index :line_items, [:order_id, :book_id], unique: true
  end
end
