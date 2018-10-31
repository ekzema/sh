class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit]
  before_action :check_delete_seller, except: [:index, :show]
  # before_action :reset_session, only: [:new, :create, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    # @products = Product.where(:visible => 1, :moderation => 1).order(created_at: :desc)
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @title = @product.name.capitalize + ' | Stockmarket'
    @description = 'Купить недорого ' + @product.name.capitalize + ' стоковая цена от ' + @product.price.to_s + ' грн.'+ ' Доставка по Украине во все города'
    if seller_signed_in?
      cur_sell = current_seller.id
    else
      cur_sell = nil
    end
    if browser.known? and cookies["view_product_#{@product.id}"].nil? and cur_sell != @product.seller_id
      cookies["view_product_#{@product.id}"] = {:value => true, :expires => 3.day.from_now.utc}
      view_count = @product.view_count + 1
      @product.update(view_count: view_count)
    end
    @category = Category.find(@product.category_id)
    twocategories_id = @category.twocategories.ids
    @twocategories = Twocategory.where(:id => twocategories_id).order(created_at: :desc)
    @seller = @product.seller
    @sellers = Seller.all.order(created_at: :desc)
    @product_sell = @seller.products.where(moderation: 1, visible: 1).order(created_at: :desc)
    @products = Product.where(moderation: 1, visible: 1).order(created_at: :desc)
    unless @product.visible == 1 and @product.moderation == 1
      redirect_to :root
    end
  end


  # GET /products/new
  def new
    @product = Product.new
    @category = Category.all.order(created_at: :desc)
  end

  # GET /products/1/edit
  def edit
    return redirect_back(fallback_location: root_path), flash[:notice] = 'Данный товар не найден' if @product.seller_id != current_seller.id
    if @product.moderation == 1
      @twocategories = Twocategory.where(category_id: @product.category_id).order(created_at: :desc)
      @threecategories = Threecategory.where(twocategory_id: @product.twocategory_id).order(created_at: :desc)
      @product.product_slide_images.build
    else
      redirect_to seller_panel_product_path
      flash[:notice] = 'Товар tщё не прошёл модерацию'
    end
  end

  # POST /products
  # POST /products.json
  def create
    @seller = Seller.find(current_seller.id)
    @product = @seller.products.new(product_params)
    respond_to do |format|
      if @product.save
        ProductMailer.new_product.deliver
        format.html { redirect_to seller_panel_product_path, notice: 'После прохождения модерации товар появится на сайте.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product = Product.find(params[:id])
    if @product.moderation == 1 or params[:product][:main_image_original_w].present?
      respond_to do |format|
        if @product.update(product_params)
          @product.update(:moderation => 0)
          ProductMailer.update_product.deliver
          format.html { redirect_to seller_panel_product_path, notice: 'Товар успешно обновлён и отправлен на модерацию' }
          format.json { render :show, status: :ok, location: @product }
        else
          format.html { render :edit }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to seller_panel_product_path
      flash[:notice] = 'Товар ещё не прошёл модерацию'
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json

  def destroy
    @product = Product.find_by(id: params[:id], deleted_at: nil)
    if ! @product || @product.seller_id != current_seller.id
      render :plain =>  'Product not found', status: 404 and return
    end
    @product.deleted_at = DateTime.current
    if @product.save
      respond_to do |format|
        format.js
      end
    else
      render :plain => 'Product was not deleted'
    end
  end

  def form_render
    @twocategory = Twocategory.where(category_id: params[:product][:category_id])
    @threecategory = Threecategory.where(twocategory_id: params[:product][:twocategory_id])
    if params[:product][:category_id]
      if params[:product][:category_id].blank?
        render text: ''
      else
        render :partial => 'twocategory', locals: {twocategory: @twocategory}
      end
    end
    if params[:product][:twocategory_id]
      if params[:product][:twocategory_id].blank?
        render text: ''
      else
        render :partial => 'threecategory', locals: {threecategory: @threecategory}
      end
    end

  end

  def delete_attachment
    @product = Product.find_by(id: params[:id], deleted_at: nil)
    if @product || @product.seller_id == current_seller.id
    @product.main_image = nil
    @product.save
    redirect_back(fallback_location: @product)
    else
      redirect_back(fallback_location: @product)
      flash[:notice] = 'Product not found'
    end
  end

  def sent_message
    @result = {success: false, message: "Возникла ошибка при отправке сообщения"}
    if params[:body].strip.empty?
      @result[:message] = "Сообщение не может быть пустым!"
      return  @result
    end
    seller = Seller.find_by_id(params[:recipient_id])
    product = Product.find(params[:product_id])
    unless seller
      @result[:message] = "Такого пользователя не существует!"
      return  @result
    end
    findMessage = SellersCrossDialog.where(seller_id: current_seller.id, product_id: product.id).take
    message_params = {seller_id: current_seller.id, recipient_id: seller.id, body: params[:body]}
    if ! findMessage
      dialog = Dialog.create
      message = Message.new(message_params)
      SellersCrossDialog.create(seller_id: current_seller.id, dialog_id:  dialog.id, product_id: product.id)
      SellersCrossDialog.create(seller_id: seller.id, dialog_id:  dialog.id, product_id: product.id)
      message.dialog_id = dialog.id
    else
      if findMessage.deleted_at
        findMessage.deleted_at = nil
        findMessage.save
      end
      message = Message.new(message_params)
      message.dialog_id = findMessage.dialog_id
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

  private

  # def reset_session
  #   if seller_signed_in? && current_seller.moderation != 1
  #     redirect_to destroy_seller_session_path
  #   end
  # end

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find_by(id: params[:id], deleted_at: nil) or not_found
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:size, :price, :quality, :category_id, :twocategory_id, :threecategory_id, :description, :meta_desc, :meta_key, :meta_title, :main_image, :name, :article, :visible, :deleted_at, :main_image_original_w, :main_image_original_h, :main_image_box_w, :main_image_aspect, :main_image_crop_x, :main_image_crop_y, :main_image_crop_w, :main_image_crop_h, product_slide_images_attributes: [:id, :_destroy, :image]
    )
  end
end