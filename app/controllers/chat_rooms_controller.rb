class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.where(['senter_id = ? or receiver_id = ?', current_user.id, current_user.id])
      #senter_id current_user.id)  ChatRoom.where(receiver_id: current_user.id)
  end

  def new
    @chat_room = ChatRoom.new
    @message = Message.new

  end

  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    if @chat_room.save
      flash[:success] = 'Chat room added!'
      #redirect_to chat_rooms_path
      redirect_to chat_room_path(@chat_room)
    else
      render 'new'
    end
  end

def show
  @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
  @message = Message.new
end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title, :receiver_id, :senter_id)
  end
end
