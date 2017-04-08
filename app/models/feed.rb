class Feed < ApplicationRecord
  validates :name, :presence => {message: '(укажите своё имя)'}
  validates :email, :presence => {message: '(укажите email)'}
  validates :description, :presence => {message: '(напишите сообщение)'}
end
