class Api::V1::MapsController < ApplicationController

    def index
        maps=Map.all
        render json: maps, include: [:areas], except: [:created_at, :updated_at]
    end

    def show
        map=Map.find(params[:id])
        render json: map
    end
end
