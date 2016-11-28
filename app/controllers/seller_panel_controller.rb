class SellerPanelController < ApplicationController
  before_action :authenticate_seller!

  def product
    @seller_products = current_seller.products.where(:visible => 1, :moderation => 1)
  end

end
