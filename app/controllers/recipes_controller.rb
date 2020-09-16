class RecipesController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create destroy]
  before_action :only_current_user, only: %i[edit destroy]

  def new
    @post = Post.find(params[:post_id])
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
    @recipe.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    @recipe = Recipe.find(params[:id])
    @recipes = @post.recipes.all
    @recipe.destroy
  end

  def index
    @post = Post.find(params[:post_id])
    @recipe = @post.recipes.build
    @recipes = @post.recipes.all
    @material = @post.materials.build
    @materials = @post.materials.all
    @item = @post.items.build
    @items = @post.items.all
  end

  def show
    @post = Post.find(params[:post_id])
    @recipe = @post.recipes.find(params[:id])
    @recipes = @post.recipes.all
    @materials = @post.materials.all
    @items = @post.items.all
  end

  def edit; end

  private

  def recipe_params
    params.require(:recipe).permit(:content, :image)
  end

  def only_current_user
    @post = Post.find(params[:post_id])
    redirect_to user_path(current_user) if current_user != @post.user
  end

end
