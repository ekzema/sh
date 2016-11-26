class AdminPanelController < ApplicationController

  def product_all
    @product = Product.all
  end

end
