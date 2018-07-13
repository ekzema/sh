class Message < ApplicationRecord
  belongs_to :dialog
  belongs_to :seller
  validates :body, :presence => true

end
