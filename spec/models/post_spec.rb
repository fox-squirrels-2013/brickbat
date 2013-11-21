require 'spec_helper'

describe Post do

  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
  it { should allow_mass_assignment_of :title }
  it { should allow_mass_assignment_of :body }

end
