class Category < ApplicationRecord
  before_create :rename_main_image
  has_many :twocategories, :dependent => :destroy
  has_many :category_slide_images, :dependent => :destroy
  accepts_nested_attributes_for :category_slide_images,
                                :allow_destroy => true,
                                :reject_if => :all_blank



  has_attached_file :main_image, :default_url => "noimage.png"
  validates_attachment_content_type :main_image, content_type: /\Aimage\/.*\z/
  validates_attachment_file_name :main_image, matches: [/png\z/, /jpe?g\z/, /gif\z/]

  def rename_main_image
    if self.main_image?
      extension = File.extname(main_image_file_name)
      self.main_image.instance_write :file_name, "#{transtlit_name self.name.mb_chars.downcase.to_s}#{extension}"
    end
  end


  def transtlit_name(name)
      name.gsub(/[а-ё\s]/,
          'а'=>'a', 'б'=>'b', 'в'=>'v', 'г'=>'g', 'д'=>'d', 'е'=>'e', 'ж'=>'zh', 'з'=>'z',
          'и'=>'i', 'й'=>'y', 'к'=>'k', 'л'=>'l', 'м'=>'m', 'н'=>'n', 'о'=>'o', 'п'=>'p',
          'р'=>'r', 'с'=>'s', 'т'=>'t', 'у'=>'u', 'ф'=>'f', 'ы'=>'i', 'э'=>'e', 'ё'=>'yo',
          'х'=>'h', 'ц'=>'ts', 'ч'=>'ch', 'ш'=>'sh', 'щ'=>'shch', 'ъ'=>'', 'ь'=>'', 'ю'=>'yu', 'я'=>'ya',
          ' ' => '-' )
  end

end
