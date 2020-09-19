class OrdersController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @order = Order.new
  end

  def create
    @post = Post.find(params[:post_id])
    @order = current_user.orders.build(order_params)
    @order.post_id = @post.id
    # ご自身の住所
    if params[:address] == 'my_address'
      @order.name = current_user.name
      @order.postal_code = current_user.postal_code
      @order.address = current_user.address
    # 登録済住所
    elsif params[:address] == 'select_address'
      address = Delivery.find(params[:order][:id])
      @order.name = address.name
      @order.postal_code = address.postal_code
      @order.address = address.address
    end
    if @order.save
      redirect_to confirm_post_order_path(@post, @order)
    else
      render 'new'
    end
  end

  def confirm
    @post = Post.find(params[:post_id])
    @order = Order.find(params[:id])
  end

  def thanks
    @post = Post.find(params[:post_id])
    @user = @post.user
    @current_user_entry = Entry.where(user_id: current_user.id)
    @user_entry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @current_user_entry.each do |cu|
        @user_entry.each do |u|
          if cu.room_id == u.room_id
            @is_room = true
            @room_id = cu.room_id
          end
        end
      end
      if @is_room
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  private

  def order_params
    params.required(:order).permit(:payment, :name, :postcode, :address)
  end
end
