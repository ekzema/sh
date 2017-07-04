class Product < ApplicationRecord
  #validates :main_image, :presence => { :message => 'укажите фотографию товара' }
  validates :name, :presence => {:message => 'не может быть пустым'}
  validates :size, :presence => {:message => 'укажите размер товара'}
  validates :price, :presence => {:message => 'укажите цену'}
  validates :quality, :presence => {:message => 'укажите состояние(качество) товара'}
  validates :description, :presence => {:message => 'опишите товар'}
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


  has_attached_file :main_image, :styles => {:original => "", :medium => ":400", :thumb => "70x70"},
                    :convert_options => {:medium => Proc.new { |instance| instance.crop_center }},
                    :default_url => "noimage.png"
  validates_attachment_content_type :main_image, content_type: /\Aimage\/.*\z/


  def crop_center
    tempfile = self.main_image.queued_for_write[:original]
    unless tempfile.nil?
      dimensions = Paperclip::Geometry.from_file(tempfile)
      w = dimensions.width
      h = dimensions.height
      if w > h
        "-resize x250 -gravity Center -crop 250x250+0+0"
      else
        "-resize 250x -gravity Center -crop 250x250+0+0"
      end
    end
  end

end
