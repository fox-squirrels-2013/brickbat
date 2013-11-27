class ResponsesController < ApplicationController

  def new
    @response = Response.new
    # you might want to make new a partial
    render :new, layout: false
  end

  def create
    # go through this, refactor it as we did with posts_controller
    @response = Response.new
    @response.user_id = session[:user_id]
    @response.post_id = params[:post_id].to_i
    @response.body = params[:response][:body]
    if @response.save
      render partial: '/layouts/response', response: @response
    else
      render json: { error: 'You failed us.'}
    end
  end


end
