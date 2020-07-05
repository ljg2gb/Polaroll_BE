class UsersController < ApplicationController

    before_action :authenticate, only: [:index, :show, :profile]

    def profile
        render json: @user, include: [:photos], status: :accepted
    end

    def index
        @users = User.all
        render json: @users
    end
    
    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def create
        @user = User.new(user_params)

        if @user.save
            token = create_token(@user)
            render json: {
                token: token,
                user_id: @user.id,
                user_name: @user.name
            }
        else
            render json: { message: @user.errors.messages }
        end
    end

    private

    def user_params 
        params.require(:user).permit(:name, :username, :email, :password)
    end

end