class MassagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(paramas[:room_id])
    @messages = @room.message.includes(:user)

  end


  def create
    @room = Room.find(paramas[:room_id])
    @message = @room.messages.new(message_params)
    
    if @message.save
      redirect_to room_messages_path(@room)
    else
      render :index
      @messages = @room.messages.includes(:user)
    end
end

private

def message_params
  paramas.require(:message).permit(:content :image).merge(user_id: current_user.id)
end
end