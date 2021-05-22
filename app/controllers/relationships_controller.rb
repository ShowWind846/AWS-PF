class RelationshipsController < ApplicationController

  def index
    @favorites = Relationship.where(corp_id: current_corp.id).order(created_at: :desc)
  end

  def create
    @user = User.find(params[:user_id])
    current_corp.follow(params[:user_id])
  end

  def destroy
    @user = User.find(params[:user_id])
    @favorite = Relationship.find_by(corp_id: current_corp.id, user_id: @user.id)
    @favorite.destroy
  end

  def follow
    @favorite = Relationship.new(follow_params)
    @favorite.save
  end

  private

  def follow_params
    params.permit(:user_id,:corp_id)
  end

end
