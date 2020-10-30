class Users::PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index like_ranking]
  before_action :only_current_user, only: %i[update edit update destroy]
  before_action :set_post, only: %i[show edit update destroy]

  def new
    @post = Post.new
    @post.recipes.build
  end

  def index
    @posts = if params[:tag_name]
               Post.tagged_with(params[:tag_name].to_s).includes(:user, :tags)
             else
               Post.page(params[:page]).per(10).includes(:user, :tags).order('created_at DESC')
             end
  end

  def edit
    @recipe = @post.recipes.build
    @recipes = @post.recipes.all
    @material = @post.materials.build
    @materials = @post.materials.all
    @item = @post.items.build
    @items = @post.items.all
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to new_users_post_recipe_path(@post)
      flash[:notice] = '材料等を入力してください'
    else
      render 'new'
    end
  end

  def update
    if @post.update(post_params)
      flash[:notice] = '投稿の更新に成功しました'
    else
      flash[:alert] = '投稿の更新に失敗しました'
    end
    redirect_to request.referer
  end

  def destroy
    if @post.user == current_user
      flash[:notice] = '投稿が削除されました' if @post.destroy
    else
      flash[:alert] = '投稿の削除に失敗しました'
    end
    redirect_to root_path
  end

  def like_ranking
    # 各投稿のいいね数を比較して並び替え
    @like_ranking_posts = Post.includes(:user, :tags).sort { |a, b| b.liked_users.count <=> a.liked_users.count }
  end

  def category_posts
    @category = Category.find(params[:category_id])
    @category_posts = @category.posts.order(created_at: :desc).all
  end

  def search
    @posts = Post.search(params[:search]).includes(:user, :tags)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :tag_list, :image, :category_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def only_current_user
    @post = Post.find(params[:id])
    redirect_to users_user_path(current_user) if current_user != @post.user
  end
end
