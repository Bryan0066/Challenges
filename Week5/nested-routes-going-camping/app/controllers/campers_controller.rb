class CampersController < ApplicationController
  

  def index
    if !params[:campsite_id]
      @title = "All Campers:"
      @campers = Camper.all
    else
      @campsite = Campsite.find(params[:campsite_id])
      @title = @campsite.name
      @campers = Camper.where(campsite_id: params[:campsite_id])
    end
  end

  def show
    @camper = Camper.find(params[:id])
    @campsite = @camper.campsite
    @supplies= @camper.supplies
  end
end
