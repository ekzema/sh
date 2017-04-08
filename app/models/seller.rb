class Seller < ApplicationRecord
  has_many :products, :dependent => :destroy
  CITY_TYPES = ['Винницкая', 'Волынская', 'Днепропетровская', 'Житомирская', 'Закарпатская', 'Запорожская', 'Ивано-Франковская', 'Киевская', 'Кировоградская', 'Луганская', 'Львовская', 'Николаевская', 'Одесская', 'Полтавская', 'Ровенская', 'Сумская', 'Тернопольская', 'Харьковская', 'Херсонская', 'Хмельницкая', 'Черкасская', 'Черниговская', 'Черновицкая']
  validates :name, :presence => {message: '(укажите своё имя)'}
  validates :surname, :presence => {message: '(укажите свою фамилию)'}
  validates :date_of_birth, :presence => {message: '(укажите свою дату рождения)'}
  validates :city, :presence => {message: '(укажите свою область)'}
  validates_inclusion_of :city, :in => CITY_TYPES + [''], :message => 'Выбран не верный формат области'

  # Include default devise modules. Others available are:
  #  and :omniauthable , :confirmable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :lockable   

  has_attached_file :avatar, :styles => { :medium => "300x300", :mini => "100x100" }, :default_url => "no_foto.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates_attachment_file_name :avatar, matches: [/png\z/, /jpe?g\z/, /gif\z/]
  crop_attached_file :avatar
end
