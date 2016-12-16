class Sellers::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  #def new
  #   super
  #end

  # POST /resource/sign_in
  def create
    moderation = Seller.find_by_email(params[:seller][:email])
    if moderation.valid_password?(params[:seller][:password])
      if moderation.moderation == 1
      self.resource = warden.authenticate!(auth_options)
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: seller_panel_product_path
      else
        redirect_back(fallback_location: root_path)
        flash[:error] = 'Ваша заяыка ещё не прошла модерацию'
      end
    else
      redirect_back(fallback_location: root_path)
      flash[:error] = 'Неверное Имя или Пароль'
    end
  end

  # DELETE /resource/sign_out
  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out(current_seller) : sign_out(resource_name))
    set_flash_message! :notice, :signed_out if signed_out
    yield if block_given?
    respond_to_on_destroy
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
