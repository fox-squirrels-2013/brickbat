require 'spec_helper'

describe Comment do

	it { should validate_presence_of :content }
	it { should belong_to :response }
  it { should allow_mass_assignment_of :content }
  # it { should respond_to :content }
  # What does this do? Necessary?

	let!(:comment) { Comment.create content: 'test content' }
  # it { comment.should be_valid }
  # What does this do? Necessary?
end


