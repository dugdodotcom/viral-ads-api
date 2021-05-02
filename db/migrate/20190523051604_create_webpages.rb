class CreateWebpages < ActiveRecord::Migration[5.2]
  def change
    create_table :webpages do |t|
      t.string :ig_handle
      t.string :page_name
      t.text :description
      t.string :video_link
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
