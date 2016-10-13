class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
    @cat = Category.new
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    twocategories_id =  @category.twocategories.ids
    @twocategories = Twocategory.where(:id => twocategories_id)
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
    @category.category_slide_images.build
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)
      if @category.save
        redirect_to categories_path, notice: "УСПЕХ!"
      else
        redirect_to categories_path, notice: "ПРОИЗОШЛА ОШИБКА!"

      end

  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_attachment
    @category= Category.find(params[:id])
    @category.main_image = nil
    @category.save
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :description, :meta_desc, :meta_key, :meta_title, :main_image,
      category_slide_images_attributes: [:id, :_destroy, :image],
      twocategories_attributes: [:id, :_destroy, :name, :description, :meta_desc, :meta_key, :meta_title,
            threecategories_attributes: [:id, :_destroy, :name, :description, :meta_desc, :meta_key, :meta_title]
      ]

      )
    end
end
