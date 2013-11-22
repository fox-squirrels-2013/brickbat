class PostsController < ApplicationController
  include TwitterHelper

  def index
    @posts = Post.all
  end

  def new 
    if session[:user_id]
      @post = Post.new
    else
      render :non_user
    end  
  end

  def create
    user = User.find_by_id(session[:user_id])
    # client = TwitterHelper.new(user)
  
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
    @post.user_id = session[:user_id]
    if @post.save
      # client.update(@post.body)
      redirect_to post_path(@post)
    else
      session[:errors] = @post.errors
      redirect_to new_post_path
    end
  end

  def show
    @post = Post.find params[:id]
    @sorted_responses = @post.responses.find(:all, :order => "votes_count DESC")
  end
  
end
