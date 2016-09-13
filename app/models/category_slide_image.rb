class CategorySlideImage < ApplicationRecord
  belongs_to :category
  before_create :rename_image
  has_attached_file :image, :default_url => "noimage.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_attachment_file_name :image, matches: [/png\z/, /jpe?g\z/, /gif\z/]

  def rename_image
    if self.image?
      extension = File.extname(image_file_name)
      self.image.instance_write :file_name, "#{CategorySlideImage.maximum(:id).to_i + 1}-#{transtlit_name self.category.name.mb_chars.downcase.to_s}#{extension}"
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
