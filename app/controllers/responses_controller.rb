class ResponsesController < ApplicationController

  def new
    @response = Response.new
  end

  def create
    p params[:responses]
    p params[:post_id]
    @response = Response.new params[:responses]#, post_id: params[:post_id]
    @response.post_id = params[:post_id]
    p @response
    if @response.save
      redirect_to post_path( @response.post ) 
    else
      redirect_to new_response_path
    end
  end

end
