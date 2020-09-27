class HomeController < ApplicationController
  def top
    if user_signed_in?
      redirect_to posts_path
    else
      @posts = Post.all
    end
  end

  def new_guest
    user = User.find_or_create_by!(name: 'ゲストユーザー', email: 'guest@example.com')
    user.password = SecureRandom.urlsafe_base64
    user.save
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
