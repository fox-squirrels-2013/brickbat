class PostsController < ApplicationController

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
    @post = Post.new params[:post]
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    @post = Post.find params[:id]
    @response = Response.new
  end
  
end
