class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    # @post = Post.find(params[:id])
    @order = Order.new(order_params)
    # ご自身の住所
    if params[:address] == "my_address"
      @order.name = current_user.name
      @order.postal_code = current_user.postal_code
      @order.address = current_user.address
    # 登録済住所
    elsif params[:address] == "select_address"
      address = Delivery.find(params[:order][:id])
      @order.name = address.name
      @order.postal_code = address.postal_code
      @order.address = address.address
    end
    if @order.save
      redirect_to  confirm_order_path(@order)
    else
      render 'new'
    end
  end

  def confirm
  
  end

  private
  def order_params
    params.required(:order).permit(:payment, :name, :postal_code, :address)
  end
end
