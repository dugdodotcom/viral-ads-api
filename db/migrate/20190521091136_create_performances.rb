class CreatePerformances < ActiveRecord::Migration[5.2]
  def change
    create_table :performances do |t|
      t.date :date
      t.integer :purchase
      t.integer :visit
      t.integer :total
      t.boolean :deleted, null: false, default: false
      t.references :product, foreign_key: true
      t.references :link, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
