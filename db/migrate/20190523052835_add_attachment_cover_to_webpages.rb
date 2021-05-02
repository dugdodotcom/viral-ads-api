class AddAttachmentCoverToWebpages < ActiveRecord::Migration[5.2]
  def self.up
    change_table :webpages do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :webpages, :cover
  end
end
