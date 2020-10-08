class Api::V1::AuthController < ApplicationController
    skip_before_action :logged_in?, only: [:create]

    def create
        player = Player.find_by(username: params[:username])

        if player && player.authenticate(params[:password])
            render json: {username: player.username, token: encode_token({player_id: player.id})} #, status: 200
        else
            render json: {error: "invalid username or password"}
        end
    end
end


end 