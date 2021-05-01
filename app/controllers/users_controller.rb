class UsersController < ApplicationController

  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def mypage
    @user = current_user
  end

  def follow
    @user = User.find(current_user.id)
    @relationships = Relationship.where(user_id: current_user.id).order(created_at: :desc)
  end

end
