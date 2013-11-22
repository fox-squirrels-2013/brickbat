class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new
    @comment.content = params[:comment][:content]
    if @comment.save
      redirect_to comment_path(@comment)
    else
      redirect_to new_post_response_comment_path
    end
  end

  def show
    @comment = Comment.find params[:id]
  end
end