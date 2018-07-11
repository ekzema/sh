class Message < ApplicationRecord
  belongs_to :dialog
  validates :body, :presence => true

end
