class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit]
  before_action :authenticate_seller!, except: [:index, :show]
  # before_action :reset_session, only: [:new, :create, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    # @products = Product.where(:visible => 1, :moderation => 1).order(created_at: :desc)
  end

  # GET /products/1
  # GET /products/1.json
  def show

    @category = Category.find( @product.category_id)
    twocategories_id =  @category.twocategories.ids
    @twocategories = Twocategory.where(:id => twocategories_id).order(created_at: :desc)
    @seller = @product.seller
    @sellers = Seller.all.order(created_at: :desc)
    @products = Product.all.order(created_at: :desc)
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
        if params[:product][:main_image].present?
          format.html { render :crop }
        end
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
          if params[:product][:main_image].present?
            format.html { render :crop }
          end
          @product.update(:moderation => 0)
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
    @product = Product.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def form_render
    @twocategory = Twocategory.where(category_id: params[:product][:category_id])
    @threecategory = Threecategory.where(twocategory_id: params[:product][:twocategory_id])
    sleep(0.5)
    if params[:product][:category_id]
      if params[:product][:category_id].blank?
        render text: ''
      else
        render :partial => 'twocategory', locals: { twocategory: @twocategory }
      end
    end

    if params[:product][:twocategory_id]
      if params[:product][:twocategory_id].blank?
        render text: ''
      else
        render :partial => 'threecategory', locals: { threecategory: @threecategory }
      end
    end

  end

  def delete_attachment
    @product= Product.find(params[:id])
    @product.main_image = nil
    @product.save
    redirect_to :back
  end
  private

  # def reset_session
  #   if seller_signed_in? && current_seller.moderation != 1
  #     redirect_to destroy_seller_session_path
  #   end
  # end

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @pars_id =  params[:name].match(/^\d{1,}/).to_s
    @product = Product.find(@pars_id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:size, :price, :quality, :category_id, :twocategory_id, :threecategory_id, :description, :meta_desc, :meta_key, :meta_title, :main_image, :name, :article, :visible, :main_image_original_w, :main_image_original_h, :main_image_box_w, :main_image_aspect, :main_image_crop_x, :main_image_crop_y, :main_image_crop_w, :main_image_crop_h,
                                    product_slide_images_attributes: [:id, :_destroy, :image]
    )
  end
end