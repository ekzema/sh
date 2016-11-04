class Product < ApplicationRecord

  belongs_to :seller
  belongs_to :category
  belongs_to :twocategory
  belongs_to :threecategory
  has_many :product_slide_images, :dependent => :destroy
  accepts_nested_attributes_for :product_slide_images,
                                :allow_destroy => true,
                                :reject_if => :all_blank

  has_attached_file :main_image, :default_url => "noimage.png"
  validates_attachment_content_type :main_image, content_type: /\Aimage\/.*\z/
  validates_attachment_file_name :main_image, matches: [/png\z/, /jpe?g\z/, /gif\z/]

  validates :name, :presence => { :message => 'не может быть пустым' }


end
