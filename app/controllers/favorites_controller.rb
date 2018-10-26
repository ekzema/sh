class FavoritesController < ApplicationController
  before_action :check_delete_seller

  def create
    result = {success: false, message: 'Error'}
    product_id = params[:product_id]
    product = Product.find(product_id)
    unless product
      result[:message] = 'Товар не найден.'
      return render json: result
    end
    favorite = Favorite.where(product_id: product_id, seller_id: current_seller.id).first
    if favorite
      result[:message] = 'Товар уже добавлен в избранное.'
      return render json: result
    end
    favorite = Favorite.new(product_id: product_id, seller_id: current_seller.id)
    unless favorite.save
      result[:message] = favorite.errors
      return render json: result
    end
    count = Favorite.where(seller_id: current_seller.id).count
    result[:success] = true
    result[:count] = count
    result[:message] = 'Товар добавлен в избранное.'
    result[:id] = product_id
    render json: result
  end


  # DELETE /favorites/1
  # DELETE /favorites/1.json
  def destroy
    result = {success: false, message: 'Error'}
    product_id = params[:product_id]
    product = Product.find(product_id)
    unless product
      result[:message] = 'Товар не найден.'
      return render json: result
    end
    favorite = Favorite.where(product_id: product_id, seller_id: current_seller.id).first
    unless favorite
      result[:message] = 'Такого товара нет в избранном.'
      return render json: result
    end
    unless favorite.destroy
      result[:message] = favorite.errors
      return render json: result
    end
    count = Favorite.where(seller_id: current_seller.id).count
    result[:success] = true
    result[:count] = count
    result[:message] = 'Товар удалён из избранного.'
    result[:id] = product_id
    render json: result
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_params
      params.fetch(:favorite, {})
    end
end
