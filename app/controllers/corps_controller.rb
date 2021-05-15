class CorpsController < ApplicationController

  before_action :authenticate_corp!, :except => [:about]

  def show
    @corp = Corp.find(params[:id])
  end

  def mypage
    @corp = current_corp
  end

  def favos
    @relationships = Relationship.where(corp_id: current_corp.id).order(created_at: :desc)
  end

  def search
    @users = User.search(params[:search])
    @users = @users.page(params[:page]).per(10)
  end

end
