class Product < ApplicationRecord
  belongs_to :category
  belongs_to :twocategory
  belongs_to :threecategory

  has_attached_file :main_image, :default_url => "noimage.png"
  validates_attachment_content_type :main_image, content_type: /\Aimage\/.*\z/
  validates_attachment_file_name :main_image, matches: [/png\z/, /jpe?g\z/, /gif\z/]
end
