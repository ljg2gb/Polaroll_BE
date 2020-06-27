class PhotosController < ApplicationController
    before_action :authenticate, only: [:index, :create]

    def index
        @photos = Photo.all
        render json: @photos
    end

    def show
        @photo = Photo.find(params[:id])
        render json: @photo
    end

    def create
        @photo = Photo.create(photo_params)
        render json: @photo
    end

    def destroy
        @photo = Photo.find(params[:id])
        @photo.destroy
        render json: {message: "Photo successfull deleted."}
    end

    private 

    def photo_params
        params.require(:photo).permit(:link, :notes).merge(user_id: @user_id)
    end
end
