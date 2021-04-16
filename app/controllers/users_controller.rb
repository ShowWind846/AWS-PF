class UsersController < ApplicationController

  def index
    @users = User.page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
  end

  # favoriteアクションを記述する
  def favorites
  end

end
