class CampsitesController < ApplicationController
  attr_reader :create
  def index
    @title = "All Campsites:"
    @campsites = Campsite.all
  end

  def show
    @campsite = Campsite.find(params[:id])
    @campers = @campsite.campers
  end
  

end
