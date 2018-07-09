class DialogsController < ApplicationController
  before_action :authenticate_seller!

  def create
    @result = {success: false, message: "Возникла ошибка при отправке сообщения"}
    if params[:message][:body].empty?
      @result[:message] = "Сообщение не может быть пустым!"
      return  @result
    end
    findmessage = Message.where(seller_id: params[:message][:seller_id], recipient_id: params[:message][:recipient_id]).take
    if ! findmessage
      dialog = Dialog.create
      message = Message.new(message_params)
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

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params.require(:message).permit(:body, :seller_id, :recipient_id)
  end
end
