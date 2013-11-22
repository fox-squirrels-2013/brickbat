class VotesController < ApplicationController

  def create
    vote = Vote.new params[:vote]
    if vote.save
      render json: { response: 'Up vote registered'}
    else
      render json: { error: 'There was an error saving the vote.'}
    end
  end

end
