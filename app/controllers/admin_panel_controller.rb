class AdminPanelController < ApplicationController

  def product_all
    @product = Product.all
  end

  def index; end

  def seller_all
    @sellers = Seller.all
  end

  def edit_seller

  end

  def update_seller
      if @seller.update(edit_seller_params)
         redirect_to seller_all_admin_panel_path
      else
        render text: 'ERROR!!!'
      end
  end



  private
  def edit_seller_params
    params.require(:seller).permit([:name, :surname, :city, :promo_code, :date_of_birth, :avatar, :moderation])
  end

end
