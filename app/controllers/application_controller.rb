class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name image])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name image])
  end

  def only_current_user
    @post = Post.find(params[:id])
    if current_user != @post.user
       redirect_to user_path(current_user)
    end
  end
end
