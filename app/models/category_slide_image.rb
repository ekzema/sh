class CategorySlideImage < ApplicationRecord
  belongs_to :category

  has_attached_file :image, :default_url => "noimage.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
