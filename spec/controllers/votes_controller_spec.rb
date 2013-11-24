require 'spec_helper'

describe VotesController do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:post) { FactoryGirl.create(:post) }
  let!(:response) { FactoryGirl.create(:response) }

  let(:vote_params){ { response: response, vote: 'Up' } }

  context "creates new votes where no user/response exists" do
    xit "should create an up vote with valid params" do
      expect{
        post :create, vote_params
        expect(parse_response_body('response')).to eq "Vote registered"
        expect(parse_response_body('vote')).to eq "Up"
        }.to change(Vote, :count).by 1
    end   

    xit "should not create a vote with invalid params" do
      expect{
        post :create, {}
        expect(parse_response_body('error')).to_not be_nil
        }.to change(Vote, :count).by 0
    end
  end

  context "does not create new votes where a user/response already exists" do
    xit "should not create a new vote object" do
        Vote.create! user_id: 1, response_id: 1, vote: 'Down'
        # try to create vote again with different vote action
      expect{
        post :create, vote_params
        }.to change(Vote, :count).by 0
    end

    xit 'should update existing vote with new vote type if different' do
        Vote.create! user_id: 1, response_id: 1, vote: 'Down'
        post :create, vote_params
        expect(parse_response_body('vote')).to eq "Up"
        expect(Vote.last.vote).to eq 'Up'
    end

    xit 'should not update vote if vote time is the same' do
        Vote.create! user_id: 1, response_id: 1, vote: 'Up'
        post :create, vote_params
        expect(parse_response_body('vote')).to eq "Up"
        expect(Vote.last.created_at).to eq Vote.last.updated_at
    end
  end

end
