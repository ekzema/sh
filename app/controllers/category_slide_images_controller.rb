class CategorySlideImagesController < ApplicationController
  def create
    category = Category.find(params[:category_id])
    category_slide_image = category.category_slide_images.create(category_slide_image_params)
  end

  private
  def category_slide_image_params
    params.require(:category_slide_image).permit([:image])
  end
end
