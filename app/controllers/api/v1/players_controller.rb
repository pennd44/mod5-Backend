class Api::V1::PlayersController < ApplicationController
    skip_before_action :logged_in?, only: [:create]

    def index
        players=Player.all
        render json: players, except: [:created_at, :updated_at]
    end

    def show
        player=Player.find(params[:id])
        render json: player
    end

    def create
        player=Player.create(player_params)
        # if player.valid?
            # player.save
            render json: player, status: :created
        # else
            # render json: {errors: "failed to create user"}, status: :not_acceptable
        # end
    end

    def update
        player=Player.find(params[:id])
        player.update(player_params)
        render json: player
    end

    private

    def player_params
        params.require(:player).permit(:username, :password_digest, :name).with_defaults( current_health: 10, max_health:10, attack:4, defense:2, energy_count:10, money_count:0, name: you)
    end
end
