class MaterialsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @material = @post.materials.build(material_params)
      if @material.save
      redirect_to new_post_recipe_path(@post)
      flash[:notice] = '投稿が保存されました'
    else
      redirect_to root_path
      flash[:alert] = '投稿に失敗しました'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @material = Material.find_by(id: params[:id])
    if @material.destroy
      redirect_to new_post_recipe_path(@post)
    else
      redirect_to root_path
      flash[:alert] = '投稿に失敗しました'
    end
  end

  private
  def material_params
    params.require(:material).permit(:name, :quantity)
  end

  
end
