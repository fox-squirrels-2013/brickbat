require 'spec_helper'

describe VotesController do



    #   t.integer "user_id"
    # t.integer "response_id"
    # t.string  "vote"

  let(:vote_params){ { user_id: 1, response_id: 1, vote: 'Up' } }

  context "Can create new votes" do
    it "should create an up vote from a user, for a response" do
      expect{
        post :create, vote: vote_params
        }.to change(Vote, :count).by 1
    end

    
  end

end
