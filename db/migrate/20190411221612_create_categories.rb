class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug
      t.boolean :deleted, null: false, default: false
      t.timestamps
    end

    add_index :categories, :slug, unique: true
  end
end
