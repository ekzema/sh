class Dialog < ApplicationRecord
  has_many :messages
  has_many :users_cross_chats, :dependent => :destroy
  has_many :messages

  def total_new seller_id, dialog_id
    count = Message.where(recipient_id: seller_id, dialog_id: dialog_id, status: nil).count
    message = " | новое сообщение " +  count.to_s
    message if count > 0
  end
end
