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
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
    @post.user_id = session[:user_id]
    @post.time_to_post = Time.now.hour + params[:countdown][0].to_i
    @post.mention = params[:mention] unless params[:mention].empty?
    @post.hashtag = params[:hashtag] unless params[:hashtag].empty?
    if @post.save
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
  
  def check
    user = User.find_by_id(session[:user_id])
    client = TwitterHelper.new(user)
    Post.all.each do |post|
      if post.time_left <= 0 && post.tweet_success == false
        client.update(post.highest_rated_response) 
        post.tweet_success = true
        post.save
      end
    end
    redirect_to '/'
  end

end
