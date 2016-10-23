class WelcomeController < ApplicationController
  def index
    @category = Category.all
    @image_count =  CategorySlideImage.count
    @i = 1

  end
end
