class Message < ApplicationRecord
  belongs_to :dialog
  validates :body, :presence => true

  def self.total_new id
    self.where(recipient_id: id, status: nil).count
  end
end
