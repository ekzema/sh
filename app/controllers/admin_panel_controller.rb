class AdminPanelController < ApplicationController

  def product_all
    @product = Product.all
  end

  def index; end

  def seller_all
    @sellers = Seller.all
  end

  def edit_seller
    pars_id =  params[:name].match(/^\d{1,}/).to_s
    @seller = Seller.find(pars_id)
  end

  def update_seller
    pars_id =  params[:name].match(/^\d{1,}/).to_s
    @seller = Seller.find(pars_id)
      if @seller.update(edit_seller_params)
         redirect_to admin_panel_seller_all_path
      else
        render :edit_seller
      end
  end



  private
  def edit_seller_params
    params.require(:seller).permit([:name, :surname, :city, :promo_code, :date_of_birth, :avatar, :moderation])
  end

end
