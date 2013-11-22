require 'spec_helper'

describe Comment do
	
	it { should validate_presence_of :content }
	it { should belong_to :response }

	let :comment { Comment.create content: 'test content' }

		it 'increases '

end