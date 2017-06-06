class TwocategoriesController < ApplicationController
  before_action :authenticate_rootadmin!, except: [:show]
  before_action :set_twocategory, only: [ :edit, :update, :destroy]
  before_action :set_twocategory_translit, only: [:show]
  layout 'adminpanel', only: [:edit, :new]

  # GET /twocategories
  # GET /twocategories.json
  def index
    @sellers = Seller.all.order(created_at: :desc)
    @products = Product.all.order(created_at: :desc)
    @category = Category.all.order(created_at: :desc)
    @categories = Category.all.order(created_at: :desc)
    @twocategories = Twocategory.all.order(created_at: :desc)
    @twocategory = Twocategory.all.order(created_at: :desc)
  end

  # GET /twocategories/1
  # GET /twocategories/1.json
  def show
    @title = @twocategory.meta_title unless @twocategory.meta_title.blank?
    @description = @twocategory.meta_desc unless @twocategory.meta_desc.blank?
    @keywords = @twocategory.meta_key unless @twocategory.meta_key.blank?
    @products = Product.where(visible: 1, moderation: 1).order(created_at: :desc)
    @showcat = @twocategory.category
    @sellers = Seller.all
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
    @twocategory = Twocategory.new(twocategory_params)

    respond_to do |format|
      if @twocategory.save
        format.html { redirect_to admin_panel_twocategories_path, notice: "Подкатегория #{@twocategory.name} успешно создана" }
        format.json { render :show, status: :created, location: admin_panel_twocategories_path }
      else
        format.html { render :new }
        format.json { render json: @twocategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /twocategories/1
  # PATCH/PUT /twocategories/1.json
  def update
    respond_to do |format|
      if @twocategory.update(twocategory_params)
        format.html { redirect_to admin_panel_twocategories_path, notice: 'Twocategory was successfully updated.' }
        format.json { render :show, status: :ok, location: admin_panel_twocategories_path }
      else
        format.html { render :edit }
        format.json { render json: @twocategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twocategories/1
  # DELETE /twocategories/1.json
  def destroy
    if @twocategory.destroy
      render text: 'ok'
    end
  end

  def delete_attachment
    @twocategory= Twocategory.find(params[:id])
    @twocategory.image = nil
    @twocategory.save
    redirect_to :back
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_twocategory
    @twocategory = Twocategory.find(params[:id])
  end

  def set_twocategory_translit
    @category = Category.find_by_translit_url(params[:category_name])
    @twocategory = Twocategory.find_by(category_id: @category.id, translit_url: params[:name])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def twocategory_params
    params.require(:twocategory).permit(:name, :category_id, :description, :meta_desc, :meta_key, :meta_title, :image, :translit_url)
  end
end