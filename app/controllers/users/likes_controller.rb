class Users::LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.likes.build(post_id: @post.id)
    @post.create_notification_like!(current_user)
    favorite.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.likes.find_by(post_id: @post.id)
    favorite.destroy
  end
end
