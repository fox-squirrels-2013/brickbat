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
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
    @post.user_id = session[:user_id]
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    @post = Post.find params[:id]
    @sorted_responses = @post.responses.find(:all, :order => "votes_count DESC")

    @response = Response.new
  end

  def vote
    
    response = Response.find_by_id(params[:response_id].to_i)
    
    user = User.find_by_id(session[:user_id])
    v = Vote.where(user_id: session[:user_id], response_id: response.id).first

    Vote.create(user_id: user.id, response_id: response.id, vote: params[:commit]) unless v

    if params[:commit] == "Up"
      response.votes_count += 1
      if v
        v.vote = "Up"
        v.save
      end
    end
    
    if params[:commit] == "Down"
      response.votes_count -= 1
      if v
        v.vote = "Down"
        v.save
      end
    end

    response.save
    id = response.post_id
    redirect_to "/posts/#{id}"

  end
  
end
