class Product < ApplicationRecord
  PRODUCT_SIZES = ['XS', 'S', 'M', 'L', 'XL', 'XXL', 'XXXL']
  #validates :main_image, :presence => { :message => 'укажите фотографию товара' }
  validates :name, :presence => { :message => 'не может быть пустым' }
  validates :size, :presence => { :message => 'укажите размер товара' }
  validates_inclusion_of :size, :in => PRODUCT_SIZES + [''], :message => 'Выбран не верный формат размера товара'
  validates :price, :presence => { :message => 'укажите цену' }
  validates :quality, :presence => { :message => 'укажите состояние(качество) товара' }
  validates :description, :presence => { :message => 'опишите товар' }
  validates :category, :presence => {message: 'выберите категорию'}
  validates :twocategory, :presence => {message: 'выберите сезон'}
  validates :threecategory, :presence => {message: 'выберите тип товара'}

  belongs_to :seller
  belongs_to :category
  belongs_to :twocategory
  belongs_to :threecategory
  has_many :product_slide_images, :dependent => :destroy
  accepts_nested_attributes_for :product_slide_images,
                                :allow_destroy => true,
                                :reject_if => :all_blank


  has_attached_file :main_image, :styles => { :medium => "250x250", :thumb => "70x70" }, :default_url => "noimage.png"
  validates_attachment_content_type :main_image, content_type: /\Aimage\/.*\z/
  crop_attached_file :main_image

end
