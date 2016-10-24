class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end


  # GET /products/new
  def new
    @product = Product.new
    @category = Category.all
  end

  # GET /products/1/edit
  def edit
    @twocategories = Twocategory.where(category_id: @product.category_id)
    @threecategories = Threecategory.where(twocategory_id: @product.twocategory_id)
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
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
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
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
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:size, :price, :quality, :category_id, :twocategory_id, :threecategory_id, :description, :meta_desc, :meta_key, :meta_title, :main_image, :name, :article, :visible, :moderation,
      product_slide_images_attributes: [:id, :_destroy, :image]
      )
    end
end
