require 'spec_helper'

describe VotesController do

  let(:vote_params){ { user_id: 1, response_id: 1, vote: 'Up' } }

  context "Can create new votes" do

    it "should create an up vote with valid params" do
      expect{
        post :create, vote: vote_params
        expect(parse_response_body('response')).to eq "Up vote registered"
        }.to change(Vote, :count).by 1
    end    

    it "should not create a vote with invalid params" do
      expect{
        post :create, vote: {}
        expect(parse_response_body('error')).to_not be_nil
        }.to change(Vote, :count).by 0
    end

    
  end

end
