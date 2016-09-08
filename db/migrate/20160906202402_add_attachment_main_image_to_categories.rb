class AddAttachmentMainImageToCategories < ActiveRecord::Migration
  def self.up
    change_table :categories do |t|
      t.attachment :main_image
    end
  end

  def self.down
    remove_attachment :categories, :main_image
  end
end
