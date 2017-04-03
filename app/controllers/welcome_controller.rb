class WelcomeController < ApplicationController
  def index
    @category = Category.all.order(created_at: :desc)
    @image_count =  CategorySlideImage.count
    @i = 1
    @sellers = Seller.all.order(created_at: :desc)
    @products = Product.all.order(created_at: :desc)
    @twocategories = Twocategory.all.order(created_at: :desc)
  end

  def about
  end

  def vip
  end

  def feedback
    @feed = Feed.new
  end

  def seller_products
    @category = Category.all.order(created_at: :desc)
    @image_count =  CategorySlideImage.count
    @i = 1
    @products = Product.all.order(created_at: :desc)
    @seller = Seller.find(params[:id])
    @sellers = Seller.all.order(created_at: :desc)
  end

end
