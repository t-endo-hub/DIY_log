class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all
    @current_user_entry = Entry.where(user_id: current_user.id)
    @user_entry = Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
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

  def followings
    @user = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
end
