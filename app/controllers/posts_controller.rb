class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
    @post.photos.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.photos.present?
      @post.save
      redirect_to root_path
      flash[:notice] = '投稿が保存されました'
    else
      redirect_to root_path
      flash[:alert] = '投稿に失敗しました'
    end
  end

  def show; end

  def edit; end

  private

  def post_params
    params.require(:post).permit(:title, :content, photos_attributes: [:image])
  end
end
