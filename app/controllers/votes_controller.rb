class VotesController < ApplicationController
  # this is doing way too much.
  def create
    response = Response.find params[:response_id]
    vote = response.votes_for(current_user).first

    if vote.nil?
      p 'creating vote'
      vote = response.votes.build :vote => params[:vote]
      vote.user = current_user
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
