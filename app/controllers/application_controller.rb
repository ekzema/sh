class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :nav_main

  def nav_main
    @catmenu = Category.all
  end
end
