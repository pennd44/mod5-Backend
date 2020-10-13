class ApplicationController < ActionController::API
    # before_action :logged_in?

    def encode_token(payload)
        JWT.encode(payload, "flatiron071320", "HS256") #algo is optional
    end

    # def logged_in?
    #     # byebug
    #     headers = request.headers["Authorization"]
    #     token = headers.split(" ")[1]

    #     begin
    #         user_id = JWT.decode(token, "flatiron071320")[0]["player_id"]
    #         player = User.find(user_id)
    #     rescue
    #         player = nil
    #     end

    #     # if user
    #     # else
    #     #     render json: {error: "Please Log in!!!"}
    #     # end

    #     render json: {error: "Please LogIn!!!"} unless player
    # end
end
