require 'spec_helper'

describe Response do

  it { should validate_presence_of :body }
  # it { should allow_mass_assignment_of :body }
  # it { should belong_to :post}

end
