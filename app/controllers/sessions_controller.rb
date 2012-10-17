class SessionsController < ApplicationController

    def new
    end

    def create
        login_name = params[:session][:sname]
        if login_name.include? '@'
            user = User.find_by_email(login_name.downcase)
        else
            user = User.find_by_name(login_name)
        end

        if user
            if user.authenticate(params[:session][:password])
                sign_in user
                redirect_to user
            else
                flash.now[:error] = 'Invalid email/password combination'
                render 'new'
            end
        else
            flash.now[:error] = "User doesn't exist"
            render 'new'

        end
    end

    def destroy
        sign_out
        redirect_to root_url
    end

end

