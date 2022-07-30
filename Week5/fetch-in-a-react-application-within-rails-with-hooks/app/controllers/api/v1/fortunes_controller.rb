class Api::V1::FortunesController < ApiController
  def show
    render json: { fortune: Fortune.all.sample }
  end
end
