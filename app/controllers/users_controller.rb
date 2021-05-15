class UsersController < ApplicationController

  before_action :authenticate_user!, :except => [:about]

  def index
    #@users = User.page(params[:page]).per(10)
    #@search = User.ransack(params[:q])
    #@users = @search.result(distinct: true).page(params[:page]).per(20)
    @users = User.search(params[:search])
    @users = @users.page(params[:page]).per(10)
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
