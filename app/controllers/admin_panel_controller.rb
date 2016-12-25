class AdminPanelController < ApplicationController
  before_action :authenticate_rootadmin!
  before_action :set_regular, only: [:edit_seller, :update_seller, :edit_product, :update_product, :delete_attachment]
  layout 'adminpanel'
  def product_all
    @product = Product.paginate(:page => params[:page], :per_page => 20)
    @sort = params[:moderation]
    if @sort == 'all'
      @product
    elsif @sort
      @product = Product.where(moderation: params[:moderation]).paginate(:page => params[:page], :per_page => 20)
    end
  end

  def index
    @sellers = Seller.where(:moderation => 0)
    @products = Product.where(:moderation => 0)
  end

  #----BEGIN seller----
  def seller_all
    @sellers = Seller.paginate(:page => params[:page], :per_page => 20)
    @sort = params[:moderation]
    if @sort == 'all'
      @sellers
      elsif @sort
      @sellers = Seller.where(moderation: params[:moderation]).paginate(:page => params[:page], :per_page => 20)
    end
  end

  def edit_seller
    @seller = Seller.find(@pars_id)
  end

  def update_seller
    @seller = Seller.find(@pars_id)
      if @seller.update(edit_seller_params)
        redirect_to admin_panel_seller_all_path
         flash[:notice] = 'Продавец успешно изменён'
      else
        render :edit_seller
      end
  end


  def delete_attachment_seller
    @seller = Seller.find(params[:id])
    @seller.avatar = nil
    @seller.save
    redirect_to :back
  end

  def delete_seller
    @seller = Seller.find(params[:seller_id])
    if @seller.destroy
      render text: 'ok'
    end
  end
  #---END seller---

  #---BEGIN product---
  def edit_product
    @product = Product.find(@pars_id)
    @twocategories = Twocategory.where(category_id: @product.category_id)
    @threecategories = Threecategory.where(twocategory_id: @product.twocategory_id)
    @ooo = @product.product_slide_images
  end

  def update_product
    @product = Product.find(@pars_id)
    if @product.update(edit_product_params)
      redirect_to admin_panel_product_all_path
    else
      render :edit_product
    end
  end

  def delete_attachment_product
    @product = Product.find(params[:id])
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

  def delete_product
    @product = Product.find(params[:product_id])
    if @product.destroy
      render text: 'ok'
    end
  end
  #---END product---

  private

  def set_regular
    @pars_id =  params[:name].match(/^\d{1,}/).to_s
  end

  def edit_seller_params
    params.require(:seller).permit([:name, :surname, :city, :promo_code, :date_of_birth, :avatar, :moderation, :email, :reset_session])
  end

  def edit_product_params
    params.require(:product).permit(:size, :price, :quality, :category_id, :twocategory_id, :threecategory_id, :description, :meta_desc, :meta_key, :meta_title, :main_image, :name, :article, :visible, :moderation,
    product_slide_images_attributes: [:id, :_destroy, :image]
    )
  end

end
