class UsersController < ApplicationController
  before_action :set_user, only: [:update, :destroy]

  # GET /users
  def index
    users = User.all
    render json: users, each_serializer: UserSerializer
  end

  # GET /users/1
  def show
    user = User.find(params[:id])
    if user === logged_in_user
      render json: user
    else
      render json: {error: user.errors.full_messages}
    end
  end

  # POST /users
  def create
    user = User.new(user_params)
    if user.save
      render_user_token(user)
    else
      render json: {error: user.errors.full_messages},  status: 403
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
      params.permit(:username, :email, :password, :bio, :photo)
    end
end
