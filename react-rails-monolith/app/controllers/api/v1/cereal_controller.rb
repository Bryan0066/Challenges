class Api::V1::CerealController < ApplicationController
    def show
      render json: { cereal: Cereal.all}
    end
end