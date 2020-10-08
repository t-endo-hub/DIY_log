class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name image discription])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name image discription])
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_users_path
    when User
      root_path
    end
  end
end
