class HomeController < ApplicationController
  def top
    @posts = Post.all
  end

  def about
    @posts = Post.all
  end

  def new_guest
    user = User.find_or_create_by!(name: 'ゲストユーザー', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
