require 'spec_helper'

describe Response do

  it { should validate_presence_of :body }
  it { should allow_mass_assignment_of :body }
  it { should allow_mass_assignment_of :post_id }
  it { should belong_to :post}


  let(:response){ Response.create body: 'test body'}

  it 'votes should default to 0' do
    expect(response.votes_count).to eq 0
  end


  describe 'can vote count' do

    it 'up_vote increases votes by 1' do
      expect{ response.up_vote
        }.to change(response, :votes_count).by 1
    end

    it 'down_vote decreases votes by 1' do
        expect{ response.down_vote
          }.to change(response, :votes_count).by -1
    end
  end
end
