require 'spec_helper'

describe Vote do

  #   belongs_to :user
  # belongs_to :response

  # attr_accessible :user_id, :response_id, :vote
  
  # validates :user_id, presence: true
  # validates :response_id, presence: true
  # validates :vote, presence: true

  it { should validate_presence_of :user_id }
  it { should validate_presence_of :response_id }
  it { should validate_presence_of :vote }

end
