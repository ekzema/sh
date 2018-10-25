class Sellers::RegistrationsController < Devise::RegistrationsController
before_action :configure_sign_up_params, only: [:create]
before_action :configure_account_update_params, only: [:update]

# before_action :reset_session, only: [:edit, :update]
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  def edit
     super
  end
# fields_change = ['email', 'name', 'surname', 'city', 'promo_code', 'date_of_birth']
# fields_change.each { |f| break render text: 'exit' if resource.previous_changes.keys.include?(f)}
  # PUT /resource


        # resource.update_without_password(params[resource_name].permit(:avatar_original_w, :avatar_original_h, :avatar_box_w, :avatar_aspect, :avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h))

  def update
    if params[:seller][:avatar_original_w].present?
      Seller.find(current_seller.id).update(seller_avatar_params)
      return redirect_to seller_panel_product_path, notice: 'Ваша учётная запись успешно обовлена'
    end
    if params[resource_name][:avatar].blank?
      super
    else
      resource_updated = update_resource(resource, account_update_params)
      yield resource if block_given?
      if resource_updated
      render :action => 'crop'
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    end
  end


  # DELETE /resource
  def destroy
    resource.deleted_at = DateTime.current
    resource.save
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message! :notice, :destroyed
    yield resource if block_given?
    respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  def delete_attachment
    @seller= Seller.find_by(id: params[:id], deleted_at: nil)
    if @seller || @seller.id == current_seller.id
      @seller.avatar = nil
      @seller.save
      redirect_back(fallback_location: @seller)
    else
      redirect_back(fallback_location: @seller)
      flash[:notice] = 'Seller not found'
    end
  end

  private
  def seller_avatar_params
    params.require(:seller).permit(:avatar, :avatar_original_w, :avatar_original_h, :avatar_box_w, :avatar_aspect, :avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h)
  end

  protected

  # def reset_session
  #   if seller_signed_in? && current_seller.moderation != 1
  #     redirect_to destroy_seller_session_path
  #   end
  # end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname, :city, :promo_code, :date_of_birth, :avatar, :phone, :description])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:name, :surname, :city, :promo_code, :date_of_birth, :avatar, :phone, :description, :avatar_original_w, :avatar_original_h, :avatar_box_w, :avatar_aspect, :avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h
     ])
  end

  # The path used after sign up.
  #def after_sign_up_path_for(resource)
  #  super(resource)
  #end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #
  # end

end
