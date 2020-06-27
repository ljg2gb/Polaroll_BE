class AuthenticationController < ApplicationController
    def login
        @user = User.find_by(username: params[:username])

        if @user

            if @user.authenticate(params[:password])
                token = create_token(@user)

                render json: {
                    token: token,
                    user_id: @user.id,
                    user_name: @user.name
                }  
            else
                render json: {message: "Invalid username or password"}, status: :unauthorized
            end
        else
            render json: {message: "Invalid username or password"}, status: :unauthorized
        end
    end
end
