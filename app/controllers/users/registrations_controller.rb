class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :username, :address])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:password, :password_confirmation, :address, :latitude, :longitude, :username])
  end

  # def create
  # end
  # def after_sign_in_path(resource)
  #   # if resource.is_admin
  #   #   :admins_path
  #   elsif resource.is_admin == false
  #     :users_path
  #   else
  #     super
  #   end
  # end
end
