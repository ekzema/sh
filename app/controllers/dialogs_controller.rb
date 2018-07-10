class DialogsController < ApplicationController
  before_action :authenticate_seller!

  def create
    @result = {success: false, message: "Возникла ошибка при отправке сообщения"}
    if params[:body].empty?
      @result[:message] = "Сообщение не может быть пустым!"
      return  @result
    end
    seller = Seller.find_by_id(params[:recipient_id])
    unless seller
      @result[:message] = "Такого пользователя не существует!"
      return  @result
    end
    findmessage = Message.where(seller_id: current_seller.id, recipient_id: seller.id).take
    message_params = {seller_id: current_seller.id, recipient_id: seller.id, body: params[:body]}
    unless findmessage
      dialog = Dialog.create
      message = Message.new(message_params)
       UsersCrossChat.create(seller_id: current_seller.id, dialog_id:  dialog.id)
       UsersCrossChat.create(seller_id: seller.id, dialog_id:  dialog.id)
      message.dialog_id = dialog.id
    else
      message = Message.new(message_params)
      message.dialog_id = findmessage.dialog_id
    end
    if message.save
      @result[:success] = true
      @result[:message] = "Сообщение было успешно отправлено"
    else
      if dialog.defined?
        dialog.destroy
      end
    end
    @result
  end

  def destroy

  end
end
