class Sellers::RegistrationsController < Devise::RegistrationsController
before_action :configure_sign_up_params, only: [:create]
before_action :configure_account_update_params, only: [:update]
before_action :reset_session, only: [:edit, :update]
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    build_resource(sign_up_params)
    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        redirect_to  :root
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  # GET /resource/edit
  def edit
     super
  end
# fields_change = ['email', 'name', 'surname', 'city', 'promo_code', 'date_of_birth']
# fields_change.each { |f| break render text: 'exit' if resource.previous_changes.keys.include?(f)}
  # PUT /resource

    def update
      self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
      prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)
      resource_updated = update_resource(resource, account_update_params)
      yield resource if block_given?
      if resource_updated
        i = 0
        fields_change = ['email', 'name', 'surname', 'city', 'promo_code', 'date_of_birth']
        fields_change.each { |f| i+=1 if resource.previous_changes.keys.include?(f) }
        if i > 0
          resource.update(:moderation => 0)
          Devise.sign_out_all_scopes ? sign_out(current_seller) : sign_out(resource_name)
          redirect_to :root, :notice => 'Ваш акаунт был изменён и отпрален на модерцию'
        else
          redirect_to seller_panel_product_path
        end
      end
    end


  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  def delete_attachment
    @seller= Seller.find(params[:id])
    @seller.avatar = nil
    @seller.save
    redirect_to :back
  end

  protected

  def reset_session
    if seller_signed_in? && current_seller.moderation != 1
      redirect_to destroy_seller_session_path
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname, :city, :promo_code, :date_of_birth, :avatar])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:name, :surname, :city, :promo_code, :date_of_birth, :avatar])
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
