class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    users = User.all
    render json: users, each_serializer: UserSerializer
  end

  # GET /users/1
  def show
    render json: user
  end

  # POST /users
  def create
    user = User.create(user_params)

    if user.valid?
      session[:user_id] = user.id #this is the piece that logs a user in and keeps track of users info in subsequent requests
      render json: user, status: :created
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if user.update(user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :bio, :photo)
    end
end
