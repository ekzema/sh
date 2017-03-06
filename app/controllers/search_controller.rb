class SearchController < ApplicationController

  def result
    
    if params[:q].blank?
      redirect_to :back, notice: 'Введите текст для поиска!'
    else
      @products = Product.order(:name).where("name LIKE ?", "%#{params[:q]}%")
    end
    @prs = Product.all
  end

  def autocomplete
    @products = Product.order(:name).where("name LIKE ?", "%#{params[:term]}%").where(visible: 1, moderation: 1).limit(10)
    render json: @products.map{|i| i.name}
  end

end
