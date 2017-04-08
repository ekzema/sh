class AddAttachmentImageToCategorySlideImages < ActiveRecord::Migration
  def self.up
    change_table :category_slide_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :category_slide_images, :image
  end
end
