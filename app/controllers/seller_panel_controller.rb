class SellerPanelController < ApplicationController
  before_action :authenticate_seller!
  # before_action :reset_session
  before_action :set_product, only: [:showproduct]

  def product
    @seller_products = current_seller.products.where(:moderation => 1).order(created_at: :desc)
  end

  def dialogs
    sql = "SELECT d.id AS dialog_id, scd2.seller_id AS seller_id, s.name AS name, s.surname AS surname FROM dialogs d
INNER JOIN sellers_cross_dialogs scd1 ON scd1.dialog_id = d.id AND scd1.seller_id = #{current_seller.id}
INNER JOIN sellers_cross_dialogs scd2 ON scd2.dialog_id = d.id AND scd2.dialog_id = scd1.dialog_id
INNER JOIN sellers s ON s.id = scd2.seller_id WHERE scd2.seller_id <> #{current_seller.id}
"
    @dialogs = Dialog.paginate(:page => params[:page], :per_page => 30).find_by_sql(sql)
    # @dialogs = ActiveRecord::Base.connection.select_all(sql)

  end

  def showproduct
    
    # unless @product.visible == 1 and @product.moderation == 1
    #   redirect_to :root
    # end
  end

  def product_visible
    @pr = Product.find_by(:id => params[:product_id], :seller_id => current_seller.id)
    if @pr
    @pr.update(:visible => params[:visible])
    head :ok
      else
        head :error
      end
  end

  def favorite
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
