class SuppliesController < ApplicationController

  def index
    # binding.pry
    if !params[:camper_id]
      @title = "All Supplies:"
      @supplies = Supply.all
    else
      @camper = Camper.find(params[:camper_id])
      @title = @camper.name
      @supplies = Supply.where(camper_id: params[:camper_id])
    end
  end

  def show
    @supply = Supply.find(params[:id])
    @camper = @supply.camper
  end
  
end
