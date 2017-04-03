class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :nav_main


  def nav_main
    @catmenu = Category.all
  end

  # def after_sign_in_path_for(resource)
  #   # check for the class of the object to determine what type it is
  #   if resource.class == Rootadmin
  #     admin_panel_path
  #   elsif resource.class == Seller
  #     seller_panel_product_path
  #   end
  # end

end
