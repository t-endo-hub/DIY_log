class Users::RoomsController < ApplicationController
  before_action :authenticate_user!

 
  def index
    @rooms = Room.all
    @user = current_user

    # DM一覧画面に最後のメッセージを表示
    @current_entries = current_user.entries.includes(:room)
    room_ids = []
    @current_entries.each do |entry|
      room_ids << entry.room.id
    end
    @another_entries = Entry.where(room_id: room_ids).where('user_id != ?', @user.id).includes(:user, :room)
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.messages.includes([:user])
      @message = Message.new
      @entries = @room.entries

      @entries.each do |entry|
        @opponent_user = User.find_by(id: entry.user_id) if entry.user_id != current_user.id
      end
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def create
    @room = Room.create
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to "/rooms/#{@room.id}"
  end
end
