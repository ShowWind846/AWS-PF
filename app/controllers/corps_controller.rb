class CorpsController < ApplicationController

  def show
    @corp = Corp.find(params[:id])
  end

  def mypage
    @corp = current_corp
  end

  def favos
    @relationships = Relationship.where(corp_id: current_corp.id).order(created_at: :desc)
  end

end
