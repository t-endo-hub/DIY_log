class RecipesController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @recipe = @post.recipes.build
    @recipes = @post.recipes.all
  end
  
  def create
    @post = Post.find(params[:post_id])
    @recipe = @post.recipes.build(recipe_params)
      if @recipe.save
      redirect_to new_post_recipe_path(@post)
      flash[:notice] = '投稿が保存されました'
    else
      redirect_to root_path
      flash[:alert] = '投稿に失敗しました'
    end
  end



  private
  def recipe_params
    params.require(:recipe).permit(:content, :image)
  end
end
