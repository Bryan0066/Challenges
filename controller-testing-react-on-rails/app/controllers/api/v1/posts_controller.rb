class Api::V1::PostsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def create
    new_post = Post.create(post_params)

    render json: new_post
  end

  private
  
  def post_params
    params.require(:post).permit(:body, :floof_id)
  end
end
