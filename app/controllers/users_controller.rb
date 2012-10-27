class UsersController < ApplicationController

    before_filter :signed_in_user, only: [:index, :edit, :update]
    before_filter :correct_user,   only: [:edit, :update]


    # GET /users
    # GET /users.json
    def index
        @users = User.paginate(page: params[:page])

        respond_to do |format|
            format.html # index.html.erb
            format.json { render json: @users }
        end
    end


    def pictures
        if params[:name]
            @user = User.find_by_name(params[:name])
        else
            if params[:id]
                @user = User.find(params[:id])
            else
                signed_in_user
                @user = current_user
            end
        end

        @images = @user.images
        @groups = @images.all.map {|i| i.group}.uniq

    end

    # GET /users/1
    # GET /users/1.json
    def show

        if params[:name]
            @user = User.find_by_name(params[:name])
        else
            if params[:id]
                @user = User.find(params[:id])
            else
                signed_in_user
                @user = current_user
            end
        end

        # respond_to do |format|
        #     format.html # show.html.erb
        #     format.json { render json: @user }
        # end
    end

    # GET /users/new
    # GET /users/new.json
    def new
        sign_out
        @user = User.new

        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @user }
        end
    end

    # GET /users/1/edit
    def edit
        @user = User.find(params[:id])
    end

    # POST /users
    # POST /users.json
    def create
        @user = User.new(params[:user])

        respond_to do |format|
            if @user.save
                sign_in @user
                format.html { redirect_to @user}#, notice: 'User was successfully created.' }
                format.json { render json: @user, status: :created, location: @user }
                flash[:success] = "User Succesfully created!"
            else
                format.html { render action: "new" }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    # PUT /users/1
    # PUT /users/1.json
    def update
        @user = User.find(params[:id])

        respond_to do |format|
            if @user.update_attributes(params[:user])
                format.html { redirect_to @user}
                format.json { head :no_content }
                flash[:success] = "Profile updated"
                sign_in @user
            else
                format.html { render action: "edit" }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /users/1
    # DELETE /users/1.json
    def destroy
        @user = User.find(params[:id])
        @user.destroy

        respond_to do |format|
            format.html { redirect_to users_url }
            format.json { head :no_content }
        end
    end

    def signed_in_user
        unless signed_in?
            store_location
            redirect_to login_url, notice: "Please sign in."
        end
    end
    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_path) unless current_user?(@user)
    end

    def add_friend
        store_location
    end

    def remove_friend
    end

end
