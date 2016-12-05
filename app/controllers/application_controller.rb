class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :nav_main

  def nav_main
    @catmenu = Category.all
  end

  def after_sign_in_path_for(resource)
    admin_panel_path if resource.class == Rootadmin
  end
end
