class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    @message.save
    redirect_back fallback_location: root_path
  end

  private

  def message_params
    params.permit(:message, :user_id, :corp_id, :room_id)
  end

end