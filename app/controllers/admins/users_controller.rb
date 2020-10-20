class Admins::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    flash[:notice] = if @user.destroy
                       'ユーザーを削除しました'
                     else
                       'ユーザーの削除の失敗しました'
                     end
    redirect_to request.referer
  end
end
