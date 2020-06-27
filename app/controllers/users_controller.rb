class UsersController < ApplicationController

    before_action :authenticate, only: [:index, :show, :profile]

    def profile
        render json: @user, status: :accepted
    end

    def index
        @users = User.all
        render json: @users
        # , include: [:friends] 
    end
    
    def show
        @user = User.find(params[:id])
        render json: @user
        # , include: [:friends]
    end
    
    def create
        @user = User.create(user_params)
        render json: @user
    end

    # def create
    #     @user = User.new(user_params)

    #     if @user.save
    #         token = create_token(@user)
    #         render json: {
    #             message: "Success user #{@user.name} has been created.",
    #             token: token
    #         }
    #     else
    #         render json: { message: @user.errors.messages }
    #     end
    # end

    private

    def user_params 
        params.require(:user).permit(:name, :username, :email, :password)
    end

end