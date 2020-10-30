class CategoriesController < ApplicationController
  before_action :set_category, only: %i[edit update destroy]

  def index
    @category = Category.new
    @categories = Category.all
  end

  
  def edit
  end
  
  def update
    if @category.update(category_params)
      flash[:notice] = "カテゴリー名を編集しました"
      redirect_to admins_categories_path
    else
      redirect_to request.referer
    end
  end
  
  def create
    if @category = Category.create(category_params)
      flash[:notice] = "カテゴリーを追加しました"
    end
    redirect_to request.referer
  end

  def destroy
    @category.destroy
    redirect_to request.referer
  end

  def category_posts
    @category = Category.find(params[:id])
    @category_posts = @category.posts.order(created_at: :desc).includes(:user, :tags)
  end


  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
