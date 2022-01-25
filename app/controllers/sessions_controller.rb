class SessionsController < ApplicationController
  
  def login
    #user = User.find_by(username: params[:username])
    user = User.find_by_username(params[:username])
     if user && user.authenticate(params[:password])
       render json: {user: UserSerializer.new(user), token: encode_token(user.id)}
     else 
       render json: "Invalid Credentials", status: unauthorized
    end
    
  end

  def autologin
    render json: {user: UserSerializer.new(logged_in_user), token: encode_token(logged_in_user.id)}
  end  

end
