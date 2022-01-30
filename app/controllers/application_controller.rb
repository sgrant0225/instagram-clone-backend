class ApplicationController < ActionController::API
    
    def encode_token(user_id) 
        JWT.encode({user_id: user_id}, ENV["JWT_SECRET"])
    end    

   def logged_in_user
    User.find(decoded_fetch_user_token["user_id"])
   end 

   def render_unprocessable_entity(invalid)
    render json: {errors: invalid.reord.errors.full_messages.to_sentence}, status: :unprocessable_entity
   end

    def render_user_token(user)
        render json: {user: ActiveModelSerializers::SerializableResource.new(user, serializer: UserSerializer), token: encode_token(user.id) }
    end    


    private   

    def fetch_user_token 
      request.headers["Authorization"]
    end    

    def decoded_fetch_user_token
        JWT.decode(fetch_user_token, ENV["JWT_SECRET"])[0]
    end   
end

