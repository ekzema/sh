class DialogsController < ApplicationController
  before_action :check_delete_seller

  def create
    @result = {success: false, message: "Возникла ошибка при отправке сообщения"}
    if params[:body].strip.empty?
      @result[:message] = "Сообщение не может быть пустым!"
    end
    return @result if params[:dialog_id].empty?
    scd = SellersCrossDialog.where(dialog_id: params[:dialog_id]).where.not(seller_id: current_seller.id).take
    message_params = {seller_id: current_seller.id, recipient_id: scd.seller_id, body: params[:body], dialog_id: scd.dialog_id}
    @message = Message.new(message_params)
    if @message.save
      @result[:success] = true
      @result[:message] = "Сообщение было успешно отправлено"
    else
      @result
    end
  end

  def show
    dialog = Dialog.find(params[:id])
    redirect_to :root if ! dialog
    @dialog_id = dialog.id
    cross = SellersCrossDialog.find(params[:id]).product_id
    @product = Product.find(cross)
    @messages = dialog.messages
    if @messages.first.seller_id == current_seller.id || @messages.first.recipient_id == current_seller.id
      @messages.each {|m| m.update(:status => Time.now) if m.recipient_id == current_seller.id && ! m.status}
      @count_all = Message.where(recipient_id: current_seller.id, status: nil).count
      else
      redirect_to :root
    end
  end

  def destroy

  end
end
