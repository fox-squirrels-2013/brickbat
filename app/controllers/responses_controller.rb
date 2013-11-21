class ResponsesController < ApplicationController

  def new
    @response = Response.new
  end

  def create
    @response = Response.new params[:response]
    @response.post_id = params[:post_id] if params[:post_id]
    if @response.save
      redirect_to post_path( @response.post ) 
    else
      redirect_to new_response_path
    end
  end

end
