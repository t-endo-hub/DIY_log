class RecipesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create destroy]
  before_action :only_current_user, only: %i[destroy]
  before_action :set_post, only: %i[new index]

  def new
    @recipe = @post.recipes.build
    @recipes = @post.recipes.all
    @material = @post.materials.build
    @materials = @post.materials.all
    @item = @post.items.build
    @items = @post.items.all
  end

  def index
    @recipe = @post.recipes.build
    @recipes = @post.recipes.all
    @material = @post.materials.build
    @materials = @post.materials.all
    @item = @post.items.build
    @items = @post.items.all
  end

  def create
    @post = Post.find(params[:post_id])
    @recipe = @post.recipes.build(recipe_params)
    @recipes = @post.recipes.all
    if @recipe.save
    else
      flash[:alert] = '作り方の追加に失敗しました'
      redirect_to request.referer
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @recipe = Recipe.find(params[:id])
    @recipes = @post.recipes.all
    @recipe.destroy
  end

  private

  def recipe_params
    params.require(:recipe).permit(:content, :image)
  end

  def only_current_user
    @post = Post.find(params[:post_id])
    redirect_to user_path(current_user) if current_user != @post.user
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
