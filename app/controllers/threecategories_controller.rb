class ThreecategoriesController < ApplicationController
  before_action :authenticate_rootadmin!, except: [:show]
  before_action :set_threecategory, only: [ :edit, :update, :destroy]
  before_action :set_threecategory_translit, only: [:show]
  layout 'adminpanel', only: [:edit, :new]

  def index
    @sellers = Seller.all.order(created_at: :desc)
    @products = Product.all.order(created_at: :desc)
    @category = Category.all.order(created_at: :desc)
    @categories = Category.all.order(created_at: :desc)
    @twocategory = Twocategory.all.order(created_at: :desc)
    @twocategories = Twocategory.all.order(created_at: :desc)
    @threecategory = Threecategory.all
  end

  def show
    @cater = @threecategory.twocategory.category
    # @twocategories = Twocategory.where(id: @cater)
    @products = Product.all.order(created_at: :desc)
    @showca = @threecategory.twocategory
    @sellers = Seller.all.order(created_at: :desc)
  end

  def new
    @threecategory = Threecategory.new
  end

  def edit
  end

  def create
    @threecategory = Threecategory.new(threecategory_params)
    respond_to do |format|
      if @threecategory.save
        format.html { redirect_to admin_panel_threecategories_path, notice: "Подкатегория #{@threecategory.name} успешно создана" }
        format.json { render :show, status: :created, location: admin_panel_threecategories_path }
      else
        format.html { render :new }
        format.json { render json: @threecategory.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @threecategory.update(threecategory_params)
        format.html { redirect_to admin_panel_threecategories_path, notice: 'threecategory was successfully updated.' }
        format.json { render :show, status: :ok, location: admin_panel_threecategories_path }
      else
        format.html { render :edit }
        format.json { render json: @threecategory.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @threecategory.destroy
      render text: 'ok'
    end
  end

  def delete_attachment
    @threecategory= Threecategory.find(params[:id])
    @threecategory.image = nil
    @threecategory.save
    redirect_to :back
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_threecategory
    @threecategory = Threecategory.find(params[:id])
  end

  def set_threecategory_translit
    @category = Category.find_by_translit_url(params[:category_name])
    @twocategory = Twocategory.find_by(category_id: @category.id, translit_url: params[:twocategory_name])
    @threecategory = Threecategory.find_by(twocategory_id: @twocategory.id, translit_url: params[:name])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def threecategory_params
    params.require(:threecategory).permit(:name, :description, :meta_desc, :meta_key, :meta_title, :image, :twocategory_id, :translit_url)
  end
end