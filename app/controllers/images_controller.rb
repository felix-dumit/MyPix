class ImagesController < ApplicationController
before_filter :signed_in_user
def new
#@current_user = User.find(1)
@image = @current_user.images.new
end

def index
@image = Image.all
end

def create
#  @image = Image.new(params[:image]) 
@image = @current_user.images.build(params[:image])
   
	if @image.save
	redirect_to  @image
    	else
	 render action: "new" 
    	end
end

def show
@image = Image.find(params[:id])
end



end
