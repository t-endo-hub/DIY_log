class Users::ItemsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @item = @post.items.build(item_params)
    @items = @post.items.all
    @item.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    @item = Item.find_by(id: params[:id])
    @items = @post.items.all
    @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
