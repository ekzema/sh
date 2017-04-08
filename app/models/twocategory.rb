class Twocategory < ApplicationRecord
  belongs_to :category
  has_many :products

  has_many :threecategories, :dependent => :destroy

  accepts_nested_attributes_for :threecategories,
                                :allow_destroy => true,
                                :reject_if => :all_blank

  validates :translit_url, :presence => {message: '(укажите название для ссылки)'}
  validates :name, :presence => {message: '(укажите название категории2)'}

  has_attached_file :image, :default_url => "noimage.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_attachment_file_name :image, matches: [/png\z/, /jpe?g\z/, /gif\z/]
end
