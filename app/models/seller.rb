class Seller < ApplicationRecord
  # Include default devise modules. Others available are:
  #  and :omniauthable, :confirmable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :lockable
end
