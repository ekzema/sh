class AdminPanelController < ApplicationController
  before_action :set_regular, only: [:edit_seller, :update_seller, :edit_product, :update_product, :delete_attachment]
  before_action :authenticate_rootadmin!
  def product_all
    @product = Product.all
  end

  def index; end

  def seller_all
    @sellers = Seller.all
  end

  def edit_seller
    @seller = Seller.find(@pars_id)
  end

  def update_seller
    @seller = Seller.find(@pars_id)
      if @seller.update(edit_seller_params)
         redirect_to admin_panel_seller_all_path
      else
        render :edit_seller
      end
  end

  def edit_product
    @product = Product.find(@pars_id)
    @twocategories = Twocategory.where(category_id: @product.category_id)
    @threecategories = Threecategory.where(twocategory_id: @product.twocategory_id)
    @product.product_slide_images.build
  end

  def update_product
    @product = Product.find(@pars_id)
    if @product.update(edit_product_params)
      redirect_to admin_panel_product_all_path
    else
      render :edit_product
    end
  end

  def delete_attachment
    @product = Product.find(@pars_id)
    @product.main_image = nil
    @product.save
    redirect_to :back
  end

  def form_render
    @twocategory = Twocategory.where(category_id: params[:product][:category_id])
    @threecategory = Threecategory.where(twocategory_id: params[:product][:twocategory_id])
    sleep(0.5)
    if params[:product][:category_id]
      if params[:product][:category_id].blank?
        render text: ''
      else
        render :partial => 'products/twocategory', locals: { twocategory: @twocategory }
      end
    end

    if params[:product][:twocategory_id]
      if params[:product][:twocategory_id].blank?
        render text: ''
      else
        render :partial => 'products/threecategory', locals: { threecategory: @threecategory }
      end
    end

  end


  private

  def set_regular
    @pars_id =  params[:name].match(/^\d{1,}/).to_s
  end

  def edit_seller_params
    params.require(:seller).permit([:name, :surname, :city, :promo_code, :date_of_birth, :avatar, :moderation])
  end

  def edit_product_params
    params.require(:product).permit(:size, :price, :quality, :category_id, :twocategory_id, :threecategory_id, :description, :meta_desc, :meta_key, :meta_title, :main_image, :name, :article, :visible, :moderation,
    product_slide_images_attributes: [:id, :_destroy, :image]
    )
  end

end
