class ImagesController < ApplicationController
    before_filter :signed_in_user
    def new
        @image = Image.new
    end

    def index
        @image = Image.all
    end

    def create
        #  @image = Image.new(params[:image])
        @image = @current_user.images.new(params[:image])
        if @image.save
            redirect_to  @image
        else
            render action: "new"
            flash[:success] = @image.errors
        end
    end

    def show
        @image = Image.find(params[:id])
    end



end
