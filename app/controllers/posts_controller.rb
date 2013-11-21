class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new 
    @post = Post.new
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

  def vote

    response = Response.find_by_id(params[:response_id].to_i)
    response.votes += 1 if params[:commit] == "Up"
    response.votes -= 1 if params[:commit] == "Down"
    response.save
    id = response.post_id
    redirect_to "/posts/#{id}"
  end
  
end
