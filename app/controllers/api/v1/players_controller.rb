class Api::V1::PlayersController < ApplicationController
    # skip_before_action :logged_in?, only: [:create]

    def index
        players=Player.all
        render json: players, except: [:created_at, :updated_at]
    end

    def show
        player=Player.find(params[:id])
        render json: player
    end

    def create
        player=Player.new(player_params)
        if player.valid?
            player.save
            render json: player, status: :created
        else
            render json: {errors: "failed to create user"}, status: :not_acceptable
        end
    end

    def update
        player=Player.find(params[:id])
        player.update(player_params)
        render json: player
    end

    def login
        player = Player.find_by(username: params[:username])
        if player && player.authenticate(params[:password])
            render json: {player: player, token: encode_token({player_id: player.id})}
        else
            render json: {error: "Invalid Username or Password"}, status: :unauthorized
        end
    end
        

    # def dojob(job_id)
    #     player = Player.find(params[:id])
    #     job = Job.find(job_id)
    #     player.update()
    # end

    private

    def player_params
        params.require(:player).permit(:username, :password).with_defaults(map_id:Map.first.id)
    end
end
