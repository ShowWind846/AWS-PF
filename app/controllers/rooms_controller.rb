class RoomsController < ApplicationController
  before_action :require_permission

  def show
    @room = Room.find(params[:id])
    @user = User.find(@room.relationship.user_id)
    @corp = Corp.find(@room.relationship.corp_id)
    if user_signed_in?
      @message_author = current_user
    elsif corp_signed_in?
      @message_author = current_corp
    end
    @messages = Message.where(room_id: @room.id).order(created_at: :desc).page(params[:page]).per(10)
  end

  private
  def require_permission
    unless user_signed_in? || corp_signed_in?
      redirect_to root_path, alert: "連絡機能のご利用にはログインが必要です。"
    end
  end
end
