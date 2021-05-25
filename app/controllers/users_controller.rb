class UsersController < ApplicationController

  before_action :authenticate_user!, :except => [:about, :show]

  def index
    @users = User.search(params[:search])
    @users = @users.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id).order(created_at: :desc).page(params[:page]).per(5)
  end

  def mypage
    @user = current_user
    @posts = Post.where(user_id: @user.id).order(created_at: :desc).page(params[:page]).per(5)
  end

  def follow
    @user = User.find(current_user.id)
    @relationships = Relationship.where(user_id: current_user.id).order(created_at: :desc)
  end

end
