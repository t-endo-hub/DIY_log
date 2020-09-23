class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index like_ranking]
  before_action :only_current_user, only: %i[edit destroy]
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
    @posts = if params[:tag_name]
               Post.tagged_with(params[:tag_name].to_s)
             else
               Post.limit(10).includes(:user).order('created_at DESC')
             end
    @popular_user = User.limit(5).order('created_at DESC')
  end

  def show
  end

  def edit; end

  def destroy
    if @post.user == current_user
      flash[:notice] = '投稿が削除されました' if @post.destroy
    else
      flash[:alert] = '投稿の削除に失敗しました'
    end
    redirect_to root_path
  end

  def update
    @post = Post.find(params[:id])
    @post.update(sales_status: params[:post][:sales_status])
    redirect_to post_path(@post)
    flash[:create] = 'YOUR post RELEASE !'
  end

  def like_ranking
    @like_ranking_posts = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :sales_status, :tag_list, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def only_current_user
    @post = Post.find(params[:id])
    redirect_to user_path(current_user) if current_user != @post.user
  end
end
