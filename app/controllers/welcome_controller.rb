class WelcomeController < ApplicationController
  def index
    @category = Category.all
    @image_count =  CategorySlideImage.count
    @i = 1
    @sellers = Seller.all
    @products = Product.all
  end

  def about
  end

  def vip  	
  end

  def comment   
  end

  def seller_products
    @category = Category.all
    @image_count =  CategorySlideImage.count
    @i = 1
    @products = Product.all
    @seller = Seller.find(params[:id])
    @sellers = Seller.all
  end

end
