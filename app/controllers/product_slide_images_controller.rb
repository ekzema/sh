class ProductSlideImagesController < ApplicationController

  def create
    product = Product.find(params[:product_id])
    product_slide_image = product.product_slide_images.create(product_slide_image_params)
  end

  private
  def product_slide_image_params
    params.require(:product_slide_image).permit([:image])
  end

end
