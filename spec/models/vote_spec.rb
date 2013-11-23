require 'spec_helper'

describe Vote do

  it { should validate_presence_of :user_id }
  it { should validate_presence_of :response_id }
  it { should validate_presence_of :vote }


  it { should allow_mass_assignment_of :user_id }
  it { should allow_mass_assignment_of :response_id }
  it { should allow_mass_assignment_of :vote }


  it { should belong_to :user }
  it { should belong_to :response }


  let(:vote){ Vote.create user_id: 1, response_id: 1, vote: 'Up' }

end
