class SessionsController < ApplicationController
  
  def login
    #user = User.find_by(username: params[:username])
    user = User.find_by_username(params[:username])
     if user && user.authenticate(params[:password])
       render_user_token(user)
     else 
       render json: {errors: "Invalid Credentials!"}, status: forbidden
    end
    
  end

  def autologin
    render_user_token(logged_in_user)
  end  

end
