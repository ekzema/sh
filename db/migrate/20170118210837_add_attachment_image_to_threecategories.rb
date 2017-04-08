class AddAttachmentImageToThreecategories < ActiveRecord::Migration
  def self.up
    change_table :threecategories do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :threecategories, :image
  end
end
