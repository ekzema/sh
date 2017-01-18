class Threecategory < ApplicationRecord
  belongs_to :twocategory
  has_many :products

  has_attached_file :image, :default_url => "noimage.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_attachment_file_name :image, matches: [/png\z/, /jpe?g\z/, /gif\z/]
end
