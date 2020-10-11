class Users::RelationshipsController < ApplicationController
  before_action :set_user

  def create
    following = current_user.follow(@user)
    @user.create_notification_follow!(current_user)
    following.save
  end

  def destroy
    following = current_user.unfollow(@user)
    following.destroy
  end

  private

  def set_user
    @user = User.find(params[:follow_id])
  end
end
