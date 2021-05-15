class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    @message.save
    @room = @message.room
      if @message.save
        if @message.user_id == nil
          @room.create_notification_message!(current_corp, @message.id)
        else
          @room.user_create_notification_message!(current_user, @message.id)
        end
      else
        render room_path(@room.id)
      end
    redirect_back fallback_location: root_path
  end

  private

  def message_params
    params.permit(:message, :user_id, :corp_id, :room_id)
  end

end