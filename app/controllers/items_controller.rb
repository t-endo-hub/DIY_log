class ItemsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @item = @post.items.build(item_params)
      if @item.save
      redirect_to new_post_recipe_path(@post)
      flash[:notice] = '投稿が保存されました'
    else
      redirect_to root_path
      flash[:alert] = '投稿に失敗しました'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @item = item.find_by(id: params[:id])
    if @item.destroy
      redirect_to new_post_recipe_path(@post)
    else
      redirect_to root_path
      flash[:alert] = '投稿に失敗しました'
    end
  end

  private
  def item_params
    params.require(:item).permit(:name)
  end

end
