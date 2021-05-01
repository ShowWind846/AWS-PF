class RoomsController < ApplicationController

  def show
    @room = Room.find(params[:id])
    @user = User.find(@room.relationship.user_id)
    @corp = Corp.find(@room.relationship.corp_id)
    @messages = Message.where(room_id: @room.id).order(created_at: :desc).page(params[:page]).per(10)
  end

end