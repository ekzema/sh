class SellerPanelController < ApplicationController
  before_action :authenticate_seller!

  def product
    @seller_products = current_seller.products.where(:moderation => 1)
  end

  def product_visible
    if params[:product_id]
  @pr = Product.find(params[:product_id])
  @pr.update(:visible => params[:visible])
  head :ok
    else
      head :error
    end

  end

end
