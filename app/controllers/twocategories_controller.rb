class TwocategoriesController < ApplicationController
  before_action :set_twocategory, only: [:show, :edit, :update, :destroy]

  # GET /twocategories
  # GET /twocategories.json
  def index
    @sellers = Seller.all
    @products = Product.all
    @category = Category.all
    @categories = Category.all
    
    @twocategory = Twocategory.all
  end

  # GET /twocategories/1
  # GET /twocategories/1.json
  def show
    threecategories_id =  @twocategory.threecategories.ids
    @threecategories = Threecategory.where(:id => threecategories_id)
  end

  # GET /twocategories/new
  def new
    @twocategory = Twocategory.new
  end

  # GET /twocategories/1/edit
  def edit
  end

  # POST /twocategories
  # POST /twocategories.json
  def create
    @category = Category.find(params[:category_id])
    @category.twocategories.create(twocategory_params)
    redirect_to :back
  end

  # PATCH/PUT /twocategories/1
  # PATCH/PUT /twocategories/1.json
  def update
    respond_to do |format|
      if @twocategory.update(twocategory_params)
        format.html { redirect_to @twocategory, notice: 'Twocategory was successfully updated.' }
        format.json { render :show, status: :ok, location: @twocategory }
      else
        format.html { render :edit }
        format.json { render json: @twocategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twocategories/1
  # DELETE /twocategories/1.json
  def destroy
    @twocategory.destroy
    redirect_to :back
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_twocategory
    @twocategory = Twocategory.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def twocategory_params
    params.require(:twocategory).permit(:name, :category_id, :description, :meta_desc, :meta_key, :meta_title)
  end
end
