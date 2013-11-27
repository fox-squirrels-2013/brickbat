class PostsController < ApplicationController
  before_filter :authenticate_user, :only => [:new]
  include TwitterHelper

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build params[:post]
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
    client = TwitterHelper.new(current_user)
    Post.check_time_left!(client)
  end

  private
  def authenticate_user
    render :non_user unless current_user
  end

end
