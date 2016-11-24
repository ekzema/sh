class SellerPanelController < ApplicationController
  before_action :authenticate_seller!

  def product; end

end
