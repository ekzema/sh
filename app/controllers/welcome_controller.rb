class WelcomeController < ApplicationController
  def index
    @category = Category.all
    @image_count =  CategorySlideImage.count
    @i = 1
    @sellers = Seller.all
    @products = Product.all
  end

  def show; end


end
