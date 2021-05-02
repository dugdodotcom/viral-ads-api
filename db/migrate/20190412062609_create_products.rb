class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :price, precision: 19, scale: 2
      t.integer :margin_per_sale
      t.integer :profit_per_visitor
      t.integer :shipping_details
      t.decimal :shipping_charges, precision: 19, scale: 2
      t.string :sizes
      t.string :colour
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.integer :quantity
      t.boolean :deleted, null: false, default: false
      t.timestamps
    end
  end
end
