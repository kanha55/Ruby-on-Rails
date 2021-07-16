class PostsController < ApplicationController
  before_action :find_post, only: %w[show update destroy]
  
  def index
    @posts = current_user.posts
    render json: @posts
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      render json: @post
    else
      render json: { message: @post.errors}
    end
  end

  def show
    if @post.present?
      render json: @post
    else
      render json: { message: "Id not found"}
    end
  end

  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: { message: @post.errors}
    end
  end

  def destroy
    @post.destroy
    render json: { message: "Successfully Deleted!"}
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = current_user.posts.find(params[:id])
  end  
end