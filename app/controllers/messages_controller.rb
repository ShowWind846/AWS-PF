class MessagesController < ApplicationController
  before_action :require_permission

  def create
    if user_signed_in?
      @messenger = current_user
    elsif corp_signed_in?
      @messenger = current_corp
    end
    @message = Message.new(message_params)
    @message.save
    @room = @message.room
    if @message.save
      if @message.user_id.nil?
        @room.create_notification_message!(current_corp, @message.id)
      else
        @room.user_create_notification_message!(current_user, @message.id)
      end
    else
      render room_path(@room.id)
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
  end

  private
  def message_params
    params.permit(:message, :user_id, :corp_id, :room_id)
  end
  def require_permission
    unless user_signed_in? || corp_signed_in?
      redirect_to root_path, alert: "連絡機能のご利用にはログインが必要です。"
    end
  end
end
