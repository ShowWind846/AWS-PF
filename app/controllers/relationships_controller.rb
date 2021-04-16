class RelationshipsController < ApplicationController
  # お気に入り機能のアクション記述
  def create
    @user = User.find(params[:user_id])
    @favorite = Relationship.new
    @favorite.user_id = @user.id
    @favorite.corp_id = current_corp.id
    @favorite.save
    redirect_back fallback_location: root_path, success: 'お気に入りに登録しました。'
  end

  # destroyを記述したいが理解ができない
  def destroy
    @user = User.find(params[:user_id])
    @favorite = Relationship.find_by(corp_id: current_corp.id, user_id: @user.id)
    @favorite.destroy
    redirect_back fallback_location: root_path, success: 'お気に入りを解除しました。'
  end
  # お気に入り登録済み一覧表示機能を作成したい
  def index
    @favorites = Relationship.where(corp_id: current_corp.id).order(created_at: :desc)
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
