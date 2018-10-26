class Sellers::SessionsController < Devise::SessionsController
before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  #def new
  #   super
  #end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    flash[:error] = 'Продавец с таким email уже зарегистрирован'
    set_flash_message!(:error, :signed_in)
    render :new, {resource: resource}
  end

  # DELETE /resource/sign_out
  # def destroy
  #     signed_out = (Devise.sign_out_all_scopes ? sign_out(current_seller) : sign_out(resource_name))
  #   set_flash_message! :notice, :signed_out if signed_out
  #   yield if block_given?
  #   respond_to_on_destroy
  # end

  protected


  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
