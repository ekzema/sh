class Dialog < ApplicationRecord
  has_many :messages
  has_many :users_cross_chats, :dependent => :destroy

end
