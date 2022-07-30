class ReviewsController < ApplicationController

def new
  @review = Review.new
  @restaurant = Restaurant.find(params[:restaurant_id])
end

def create
  @review = Review.new(review_params)
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review.restaurant = @restaurant
  if @review.save
    flash[:success] = "Review added successfully"
    redirect_to @restaurant
  else
    flash[:error] = @review.errors.full_messages.to_sentence
    render 'new'
  end
end

def review_params
  params.require(:review).permit( :rating, :body)
end


end
