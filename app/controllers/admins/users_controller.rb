class Admins::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "ユーザーを削除しました"
    else
      flash[:notice] = "ユーザーの削除の失敗しました"
    end
    redirect_to request.referer
  end
end
