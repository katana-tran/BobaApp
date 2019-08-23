class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def show
        if !set_user
            redirect_to signin_path
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to cups_path
        else 
            redirect_to signup_path
            flash[:error_message] = "The user "
        end
    end

    private 
    def user_params
        params.require(:user).permit(:username,:password_digest,:password,:name,:email)
    end
end
