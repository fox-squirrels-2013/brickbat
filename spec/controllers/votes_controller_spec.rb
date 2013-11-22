require 'spec_helper'

describe VotesController do

  let!(:set_user) { session[:user_id] = 1}
  let(:vote_params){ { response_id: 1, vote: 'Up' } }

  context "creates new votes where no user/response exists" do
    it "should create an up vote with valid params" do
      expect{
        post :create, vote: vote_params
        expect(parse_response_body('response')).to eq "Vote registered"
        expect(parse_response_body('vote')).to eq "Up"
        }.to change(Vote, :count).by 1
    end    

    it "should not create a vote with invalid params" do
      expect{
        post :create, vote: {}
        expect(parse_response_body('error')).to_not be_nil
        }.to change(Vote, :count).by 0
    end
  end

  context "does not create new votes where a user/response already exists" do
    it "should not create a new vote object" do
        Vote.create! user_id: 1, response_id: 1, vote: 'Down'
        # try to create vote again with different vote action
      expect{
        post :create, vote: vote_params
        }.to change(Vote, :count).by 0
    end

    it 'should update existing vote with new vote type' do
        Vote.create! user_id: 1, response_id: 1, vote: 'Down'
        post :create, vote: vote_params
        expect(parse_response_body('vote')).to eq "Up"
        expect(Vote.last.vote).to eq 'Up'
    end
  end

end
