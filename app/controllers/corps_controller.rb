class CorpsController < ApplicationController

  def favos
    @relationships = Relationship.where(corp_id: current_corp.id).order(created_at: :desc)
  end

end
