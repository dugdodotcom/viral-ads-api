class CreateCartsLists < ActiveRecord::Migration[5.2]
  def change
    create_table :carts_lists do |t|
      t.references :cart, foreign_key: true
      t.string :name
      t.string :surname
      t.string :address
      t.string :phone
      t.string :email
      t.boolean :deleted, null: false, default: false
      t.decimal :total_price, precision: 19, scale: 2
      t.decimal :total_rate, precision: 19, scale: 2
      t.decimal :total_shipping_charges, precision: 19, scale: 2
      t.decimal :total_total_price, precision: 19, scale: 2
      t.integer :total_quantity
      t.timestamps
    end
  end
end
