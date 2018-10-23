class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :nav_main, :setting_site, :metateg


  def nav_main
    @catmenu = Category.all
    @message_new = Message.where(recipient_id: current_seller.id, status: nil).count if seller_session
  end

  def setting_site
    @domen = 'stockmarket.com.ua'
  end

  def metateg
    @title = 'Стоковая одежда недорого на сайте: ' + @domen
    @description = 'Мужская, женская и детская стоковая одежда от ведущих мировых брендов по сомым низким ценам в Украине на сайте: ' + @domen
    @keywords = 'стоковая детская одежда, одежда секондхенд, стоковая женская одежда, сток оптом, одежда секондхенд украина, женская одежда secondhand украина, купить одежду secondhand, детская одежда secondhand, одежда secondhand, стоковая одежда оптом,  брендовая стоковая одежда, дешевая одежда secondhand, сток одежда оптом, купить сток одежду, сток украина'
  end

  def after_sign_in_path_for(resource)
    # check for the class of the object to determine what type it is
    if resource.class == Rootadmin
      admin_panel_path
    elsif resource.class == Seller
      seller_panel_product_path
    end
  end

  def not_found
    render_404 if Rails.env == 'production'
  end

  def render_404
    render :file => "#{Rails.root}/public/404", :layout => false, :status => 404
  end

end
