class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    @like = current_user.likes.build(like_params)
    @post = @like.post
    @like.save
    post = Post.find(params[:post_id])
    # ここから
    post.create_notification_like!(current_user)
    # ここまで
    respond_to :js

    
  end

  def destroy
    @like = Like.find_by(id: params[:id])
    @post = @like.post
    @like.destroy
    respond_to :js
  end

  private

  def like_params
    params.permit(:post_id)
  end
end
