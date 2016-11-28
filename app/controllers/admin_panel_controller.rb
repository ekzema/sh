class AdminPanelController < ApplicationController

  def product_all
    @product = Product.all
  end

  def index; end

end
