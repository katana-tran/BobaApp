class ApplicationController < ActionController::Base
    helper_method :signed_in?

    def redirected_user
      if !signed_in?
        redirect_to signin_path
      end
    end
  
    def signed_in?
      !!session[:user_id]
    end
  
    def set_user
      if signed_in?
        @user = User.find_by(id: session[:user_id])
      end
    end
end
