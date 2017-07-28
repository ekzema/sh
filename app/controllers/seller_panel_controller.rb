class SellerPanelController < ApplicationController
  before_action :authenticate_seller!
  # before_action :reset_session
  before_action :set_product, only: [:showproduct]

  def product
    @seller_products = current_seller.products.where(:moderation => 1).order(created_at: :desc)
  end

  def sms

  end

  def showproduct
    
    # unless @product.visible == 1 and @product.moderation == 1
    #   redirect_to :root
    # end
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

  # def reset_session
  #   if seller_signed_in? && current_seller.moderation != 1
  #     redirect_to destroy_seller_session_path
  #   end
  # end

  def set_product
    @pars_id =  params[:name].match(/^\d{1,}/).to_s
    @product = Product.find(@pars_id)
  end

end
