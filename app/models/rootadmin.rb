class Rootadmin < ApplicationRecord
  # Include default devise modules. Others available are:
  #  and :omniauthable, :confirmable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :lockable, :authentication_keys => [:name]
  validates :name, presence: true
end
