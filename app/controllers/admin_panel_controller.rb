class AdminPanelController < ApplicationController
  before_action :authenticate_rootadmin!
  before_action :set_regular, only: [:edit_seller, :update_seller, :edit_product, :update_product, :delete_attachment]
  before_action :set_product, only: [:edit_product, :update_product]
  before_action :set_seller, only: [:edit_seller, :update_seller]
  layout 'adminpanel'
  def product_all
    @product = Product.where(deleted_at: nil).paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
    @sort = params[:moderation]
    if @sort == 'all'
      @product
    elsif @sort
      @product = Product.where(moderation: params[:moderation], deleted_at: nil).paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
    end
  end

  def index
    @sellers = Seller.where(:moderation => 0)
    @products = Product.where(:moderation => 0)
    @feeds = Feed.where(:moderation => 0)
  end

  #----BEGIN seller----
  def seller_all
    @sellers = Seller.where(deleted_at: nil).paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
    @sort = params[:moderation]
    if @sort == 'all'
      @sellers
    elsif @sort
      @sellers = Seller.where(moderation: params[:moderation], deleted_at: nil).paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
    end
  end

  def edit_seller
  end

  def update_seller
    if @seller.update(edit_seller_params)
      redirect_to admin_panel_seller_all_path
      flash[:notice] = 'Продавец успешно изменён'
    else
      render :edit_seller
    end
  end


  def delete_attachment_seller
    @seller = Seller.find_by(id: params[:id], deleted_at: nil)
    if @seller
      @seller.avatar = nil
      @seller.save
      redirect_back(fallback_location: @seller)
    else
      redirect_back(fallback_location: @seller)
      flash[:notice] = 'Seller not found'
    end
  end

  def delete_seller
    @seller = Seller.find_by(id: params[:id], deleted_at: nil)
    if ! @seller
      render :plain =>  'Seller not found', status: 404 and return
    end
    @seller.deleted_at = DateTime.current
    if @seller.save
      render plain: 'ok'
    else
      render plain: 'Seller has not been deleted'
    end
  end
  #---END seller---

  #---BEGIN product---
  def edit_product
    @twocategories = Twocategory.where(category_id: @product.category_id)
    @threecategories = Threecategory.where(twocategory_id: @product.twocategory_id)
    @ooo = @product.product_slide_images
  end

  def update_product
    if @product.update(edit_product_params)
      redirect_to admin_panel_product_all_path
    else
      render :edit_product
    end
  end

  def delete_attachment_product
    @product = Product.find_by(id: params[:id], deleted_at: nil)
    if @product || @product.seller_id == current_seller.id
      @product.main_image = nil
      @product.save
      redirect_back(fallback_location: @product)
    else
      redirect_back(fallback_location: @product)
      flash[:notice] = 'Product not found'
    end
  end

  def form_render
    @twocategory = Twocategory.where(category_id: params[:product][:category_id])
    @threecategory = Threecategory.where(twocategory_id: params[:product][:twocategory_id])
    sleep(0.5)
    if params[:product][:category_id]
      if params[:product][:category_id].blank?
        render plain: ''
      else
        render :partial => 'products/twocategory', locals: { twocategory: @twocategory }
      end
    end

    if params[:product][:twocategory_id]
      if params[:product][:twocategory_id].blank?
        render plain: ''
      else
        render :partial => 'products/threecategory', locals: { threecategory: @threecategory }
      end
    end
  end

  def delete_product
    @product = Product.find_by(id: params[:id], deleted_at: nil)
    if ! @product
      render :plain =>  'Product not found', status: 404 and return
    end
    @product.deleted_at = DateTime.current
    if @product.save
      render plain: 'ok'
    else
      render :plain => 'Product was not deleted'
    end
  end
  #---END product---

  # BEGIN categories
  def categories
    @category = Category.paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
  end
  # END categories

  # BEGIN twocategories
  def twocategories
    @twocategory = Twocategory.paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
  end
  # END twocategories

  # BEGIN threecategories
  def threecategories
    @threecategory = Threecategory.paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
  end
  # END threecategories

  # BEGIN feed
  def feedback
    @feed = Feed.paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
    @sort = params[:moderation]
    if @sort == 'all'
      @feed
    elsif @sort
      @feed = Feed.where(moderation: params[:moderation]).paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
    end
  end
  # END feed

  private

  def set_product
    @product = Product.find_by(id: @pars_id, deleted_at: nil) or not_found
  end

  def set_seller
    @seller = Seller.find_by(id: @pars_id, deleted_at: nil) or not_found
  end

  def set_regular
    @pars_id =  params[:name].match(/^\d{1,}/).to_s
  end

  def edit_seller_params
    params.require(:seller).permit([:name, :surname, :city, :promo_code, :date_of_birth, :avatar, :moderation, :email, :reset_session])
  end

  def edit_product_params
    params.require(:product).permit(:size, :price, :quality, :category_id, :twocategory_id, :threecategory_id, :description, :meta_desc, :meta_key, :meta_title, :main_image, :name, :article, :visible, :moderation, :deleted_at,
                                    product_slide_images_attributes: [:id, :_destroy, :image]
    )
  end

end