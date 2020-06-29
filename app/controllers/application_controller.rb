class ApplicationController < ActionController::API

    def authenticate
        authorization_header = request.headers["Authorization"]

        if authorization_header
            token = authorization_header.split(" ")[1]
            begin
                secret = ENV["SECRET_KEY_BASE"] || Rails.application.secrets.secret_key_base
                @user_id = JWT.decode(token, secret)[0]["user_id"]
                @user = User.find(@user_id)
            rescue
                render json: {message: "nice try"}, status: :unauthorized
            end
        else 
            render json: {message: "nice try"}, status: :unauthorized
        end
    end

    def create_token(user)
        payload = { user_id: user.id }
        secret = ENV["SECRET_KEY_BASE"] || Rails.application.secrets.secret_key_base 
        JWT.encode(payload, secret)
    end
end
