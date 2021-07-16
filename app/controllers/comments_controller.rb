class CommentsController < ApplicationController
  before_action :find_comment, only: %w[show update destroy]

  def index
    @comments = current_user.comments
    render json: @comments
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      render json: @comment
    else
      render json: { message: @comment.errors}
    end
  end

  def show
    if @comment.present?
      render json: @comment
    else
      render json: { message: "Id not found"}
    end
  end

  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: { message: @comment.errors}
    end
  end

  def destroy
    @comment.destroy
    render json: { message: "Successfully Deleted!"}
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

  def find_comment
    @comment = current_user.comments.find(params[:id])
  end  
end