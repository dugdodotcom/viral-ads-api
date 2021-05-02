class AddAttachmentLogoToWebpages < ActiveRecord::Migration[5.2]
  def self.up
    change_table :webpages do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :webpages, :logo
  end
end
