class ResponsesController < ApplicationController

  def new
    @response = Response.new
    render :new, layout: false
  end

  def create
    @response = Response.new
    @response.user_id = session[:user_id]
    @response.post_id = params[:post_id].to_i
    @response.body = params[:response][:body]
    if @response.save
      redirect_to post_path( @response.post ) 
    else
      redirect_to new_post_response_path(params[:post_id])
    end
  end

 
end
