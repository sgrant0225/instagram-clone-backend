class PostsController < ApplicationController
  before_action :set_post, only: [:update, :destroy]

  # GET /posts
  def index
    posts = Post.all
    render json: posts
  end

  # GET /posts/1
  def show
    post = Post.find(params[:id])
    render json: post, serializer: PostSerializer
    
  end

  # POST /posts
  def create
    post = logged_in_user.posts.build(post_params)
  #  post = Post.new(post_params)
  #  post.user_id = logged_in_user.id
    if post.save
      render json: post, status: :created, location: post
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if post.update(post_params)
      render json: post
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.permit(:image, :likes, :caption)
    end
end
