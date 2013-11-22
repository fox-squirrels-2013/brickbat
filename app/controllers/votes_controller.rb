class VotesController < ApplicationController

  def create
    vote = Vote.where(user_id:     session[:user_id], 
                      response_id: params[:response_id]).first
    if vote.nil?
      p 'creating vote'
      vote = Vote.new user_id:     session[:user_id],
                      response_id: params[:response_id],
                      vote:        params[:vote]
    else
      p 'vote overwrite'
      vote.vote = params[:vote]
    end

    if vote.save
      render json: { new_total: vote.response.vote_total}
    else
      render json: { error: 'There was an error saving the vote.'}
    end
  end

end
