class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.references :cart, foreign_key: true
      t.integer :influencer_id
      t.string :token, uniq: true
      t.string :name
      t.string :surname
      t.string :address
      t.string :phone
      t.string :email
      t.boolean :checkout, default: true, empty: false
      t.boolean :deleted, null: false, default: false
      t.timestamps
    end

    add_index :carts, :influencer_id
  end
end
