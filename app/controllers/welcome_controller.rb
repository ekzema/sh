class WelcomeController < ApplicationController
  def index
    @category = Category.all
  end
end
