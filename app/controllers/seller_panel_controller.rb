class SellerPanelController < ApplicationController
  before_action :authenticate_seller!
  before_action :reset_session

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

  private

  def reset_session
    if seller_signed_in? && current_seller.moderation != 1
      redirect_to destroy_seller_session_path
    end
  end

end
