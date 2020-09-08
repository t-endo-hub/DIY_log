class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[show destroy]

  def new
    @post = Post.new
    @post.recipes.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to new_post_recipe_path(@post)
      flash[:notice] = '投稿が保存されました'
    else
      redirect_to root_path
      flash[:alert] = '投稿に失敗しました'
    end
  end

  def index
    @posts = Post.limit(10).includes(:user).order('created_at DESC')
    @popular_user = User.limit(5).order('created_at DESC')
  end

  def show; end

  def edit; end

  def destroy
    if @post.user == current_user
      flash[:notice] = '投稿が削除されました' if @post.destroy
    else
      flash[:alert] = '投稿の削除に失敗しました'
    end
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
