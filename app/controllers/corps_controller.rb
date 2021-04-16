class CorpsController < ApplicationController

  def favos
    @favorites = Relationship.where(corp_id: current_corp.id).order(created_at: :desc)
    #binding.pry
  end

end
