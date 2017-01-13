class ThreecategoriesController < ApplicationController
  before_action :set_threecategory, only: [:show, :edit, :update, :destroy]

  def index
    @sellers = Seller.all
    @products = Product.all
    @category = Category.all
    @categories = Category.all
    @twocategory = Twocategory.all
    @twocategories = Twocategory.all



    @threecategory = Threecategory.all
  end

  def show
  end

  def new
    @threecategory = Threecategory.new
  end

  def edit
  end

  def create
    @twocategory = Twocategory.find(params[:twocategory_id])
    @twocategory.threecategories.create(threecategory_params)
    redirect_to :back
  end

  def update
    respond_to do |format|
      if @threecategory.update(threecategory_params)
        format.html { redirect_to @threecategory, notice: 'threecategory was successfully updated.' }
        format.json { render :show, status: :ok, location: @threecategory }
      else
        format.html { render :edit }
        format.json { render json: @threecategory.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @threecategory.destroy
    redirect_to :back
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_threecategory
    @threecategory = Threecategory.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def threecategory_params
    params.require(:threecategory).permit(:name, :description, :meta_desc, :meta_key, :meta_title)
  end
end
