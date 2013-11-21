require 'spec_helper'

describe Response do

  it { should validate_presence_of :body }
  it { should allow_mass_assignment_of :body }
  it { should allow_mass_assignment_of :post_id }
  it { should belong_to :post}


  let(:response){ Response.create body: 'test body'}

    it 'votes should defualt to 0' do
      expect(response.votes).to eq 0
    end

end
