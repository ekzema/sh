class ProductSlideImage < ApplicationRecord
  belongs_to :product

  has_attached_file :image, :default_url => "noimage.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
