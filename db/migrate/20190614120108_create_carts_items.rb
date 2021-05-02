class CreateCartsItems < ActiveRecord::Migration[5.2]
  def change
    create_table :carts_items do |t|
      t.references :carts_list, foreign_key: true
      t.references :product, foreign_key: true
      t.decimal :price, precision: 19, scale: 2
      t.integer :margin_per_sale
      t.decimal :rate, precision: 19, scale: 2
      t.integer :shipping_details
      t.decimal :shipping_charges, precision: 19, scale: 2
      t.decimal :total_price, precision: 19, scale: 2
      t.string :sizes
      t.string :colour
      t.references :category, foreign_key: true
      t.integer :quantity
      t.boolean :deleted, null: false, default: false
      t.timestamps
    end
  end
end
