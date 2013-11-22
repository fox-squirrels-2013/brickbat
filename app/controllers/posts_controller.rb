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

  def vote

    response = Response.find_by_id(params[:response_id].to_i)

    user = User.find_by_id(session[:user_id])
    v = Vote.where(user_id: session[:user_id], response_id: response.id).first

    Vote.create(user_id: user.id, response_id: response.id, vote: params[:commit]) unless v

    if params[:commit] == "Up"
      response.votes_count += 1
      if v
        response.votes_count += 1
        v.vote = "Up"
        v.save
      end
    end

    if params[:commit] == "Down"
      response.votes_count -= 1
      if v
        response.votes_count -= 1
        v.vote = "Down"
        v.save
      end
    end

    if params[:commit] == "Clear"
      response.votes_count -= 1 if params[:previous_vote] == "Up"
      response.votes_count += 1 if params[:previous_vote] == "Down"
      v.destroy
    end

    response.save
    id = response.post_id
    redirect_to "/posts/#{id}"

  end

end
