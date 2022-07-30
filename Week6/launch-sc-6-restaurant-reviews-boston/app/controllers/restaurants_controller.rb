class RestaurantsController < ApplicationController


  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end
  

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:success] = "Restaurant added successfully"
      redirect_to @restaurant
    else
      flash[:error] = @restaurant.errors.full_messages.to_sentence
      render 'new'
    end
  end
  
  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews
  end
  
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :state, :city, :zip, :description)
  end

end
