class RegistrationsController < Devise::RegistrationsController
  before_action :only_current_user, only: %i[update]

  protected

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

  def after_update_path_for(resource)
    users_user_path(resource)
  end

  def only_current_user
    redirect_to users_user_path(current_user) if current_user != resource
  end
end
