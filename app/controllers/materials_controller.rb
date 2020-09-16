class MaterialsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @material = @post.materials.build(material_params)
    @materials = @post.materials.all
    @material.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    @material = Material.find_by(id: params[:id])
    @materials = @post.materials.all
    @material.destroy
  end

  private

  def material_params
    params.require(:material).permit(:name, :quantity)
  end
end
