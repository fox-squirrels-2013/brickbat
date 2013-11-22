class VotesController < ApplicationController

  def create

    vote = Vote.where(user_id: session[:user_id], 
                      response_id: params[:vote][:response_id]).first
    if vote.nil?
      vote = Vote.new user_id: session[:user_id],
                      response_id: params[:vote][:response_id],
                      vote: params[:vote][:vote]
    else
      vote.vote = params[:vote][:vote]
    end

    if vote.save
      render json: { response: "Vote registered", vote: vote.vote}
    else
      render json: { error: 'There was an error saving the vote.'}
    end
  end

end
