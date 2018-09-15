class DialogsController < ApplicationController
  before_action :authenticate_seller!

  def create
    @result = {success: false, message: "Возникла ошибка при отправке сообщения"}
    if params[:body].empty?
      @result[:message] = "Сообщение не может быть пустым!"
      return  @result
    end
    seller = Seller.find_by_id(params[:recipient_id])
    product = Product.find(params[:product_id])
    arr = [current_seller.id, seller.id]
    unless seller
      @result[:message] = "Такого пользователя не существует!"
      return  @result
    end
    findmessage = SellersCrossDialog.where(seller_id: current_seller.id, product_id: product.id).take
    message_params = {seller_id: current_seller.id, recipient_id: seller.id, body: params[:body]}
    unless findmessage
      dialog = Dialog.create
      message = Message.new(message_params)
      SellersCrossDialog.create(seller_id: current_seller.id, dialog_id:  dialog.id, product_id: product.id)
      SellersCrossDialog.create(seller_id: seller.id, dialog_id:  dialog.id, product_id: product.id)
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

  def show
    dialog = Dialog.find(params[:id])
    @messages = dialog.messages
    @count = 0
    @messages.each do |m|
      if m.recipient_id == current_seller.id && ! m.status
        m.update(:status => Time.now)
        @count += 1
      end
    end
    @count_all = Message.where(recipient_id: current_seller.id, status: nil).count
  end

  def destroy

  end
end
