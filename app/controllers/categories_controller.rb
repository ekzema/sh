class CategoriesController < ApplicationController
  before_action :authenticate_rootadmin!, except: [:show]
  before_action :set_category, only: [:edit, :update, :destroy]
  before_action :set_category_translit, only: [:show]
  layout 'adminpanel', only: [:edit, :new]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all.order(created_at: :desc)
    @cat = Category.new
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @title = @category.meta_title unless @category.meta_title.blank?
    @description = @category.meta_desc unless @category.meta_desc.blank?
    @keywords = @category.meta_key unless @category.meta_key.blank?
    @sellers = Seller.all.order(created_at: :desc)
    @products = @category.products.where(visible: 1, moderation: 1).order(created_at: :desc)
     
    twocategories_id =  @category.twocategories.ids
    @twocategories = Twocategory.where(:id => twocategories_id).order(created_at: :desc)
  end
 
  # GET/categories/new
  def new
    @category = Category.new
    @category.category_slide_images.build
  end

  # GET /categories/1/edit
  def edit
    @category.category_slide_images.build
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_panel_categories_path, notice: "Категория #{@category.name} успешно создана" }
        format.json { render :show, status: :created, location: admin_panel_categories_path }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to admin_panel_categories_path, notice: "Категория #{@category.name} успешно обновлена" }
        format.json { render :show, status: :created, location: admin_panel_categories_path }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    if @category.destroy
      render text: 'ok'
    end
  end

  def delete_attachment
    @category = Category.find(params[:id])
    @category.main_image = nil
    @category.save
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

  def set_category_translit
    @category = Category.find_by_name(params[:name])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :description, :meta_desc, :meta_key, :meta_title, :main_image, :translit_url,
      category_slide_images_attributes: [:id, :_destroy, :image],
      twocategories_attributes: [:id, :_destroy, :name, :description, :meta_desc, :meta_key, :meta_title, :image,
            threecategories_attributes: [:id, :_destroy, :name, :description, :meta_desc, :meta_key, :meta_title]
      ]

      )
    end
end
