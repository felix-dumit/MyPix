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
            redirect_to  pictures_path(@current_user)
        else
            render action: "new"
            flash[:success] = @image.errors
        end
    end

    def show
        @image = Image.find(params[:id])
    end

    # GET /images/1/edit
    def edit
        @image = Image.find(params[:id])
    end

     # PUT /users/1
    # PUT /users/1.json
    def update
        @image = Image.find(params[:id])

        respond_to do |format|
            if @image.update_attributes(params[:image])
                format.html { redirect_to pictures_path(@current_user)}
                format.json { head :no_content }
                flash[:success] = "Image updated"

            else
                format.html { render action: "edit" }
                format.json { render json: @image.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /images/1
    # DELETE /images/1.json
    def destroy
        @image = Image.find(params[:id])
        @image.destroy

        respond_to do |format|
            format.html { redirect_to mypage_url }
            format.json { head :no_content }
        end
    end



end
