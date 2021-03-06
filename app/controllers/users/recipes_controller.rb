class Users::RecipesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create update destroy]
  before_action :only_current_user, only: %i[update destroy]
  before_action :set_post, only: %i[new index create update destroy]
  before_action :set_recipes, only: %i[update destroy]

  def new
    @recipe = @post.recipes.build
    @recipes = @post.recipes.all
    @material = @post.materials.build
    @materials = @post.materials.all
    @item = @post.items.build
    @items = @post.items.all
  end

  def index
    @recipes = @post.recipes.all
    @materials = @post.materials.all
    @items = @post.items.all
  end

  def create
    @recipe = @post.recipes.build(recipe_params)
    @recipes = @post.recipes.all
    @recipe.save
  end

  def update
    @recipe.update(recipe_params)
  end

  def destroy
    @recipe.destroy
  end

  private

  def recipe_params
    params.require(:recipe).permit(:content, :image)
  end

  def only_current_user
    @post = Post.find(params[:post_id])
    redirect_to users_user_path(current_user) if current_user != @post.user
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_recipes
    @recipe = Recipe.find(params[:id])
    @recipes = @post.recipes.all
  end
end
