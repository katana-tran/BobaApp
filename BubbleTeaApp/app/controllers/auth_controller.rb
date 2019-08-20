class AuthController < ApplicationController
    def signin
    end
    
    def verify
    @user = User.find_by(username: params[:login][:username])
        if @user && @user.authenticate(params[:login][:password])
            session[:user_id] = @user.id
            redirect_to cups_path
        else
            flash[:error_message] = "Wrong login info. Try again."
            render :signin
        end
    end

    def signout
        session.clear
        redirect_to signin_path
    end
end
