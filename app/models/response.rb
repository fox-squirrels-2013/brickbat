class Response < ActiveRecord::Base
  attr_accessible :body, :post_id
  validates_presence_of :body

  has_many :votes
  belongs_to :user
  belongs_to :post

  def up_vote
    self.votes_count += 1
  end

  def down_vote
    self.votes_count -= 1
  end
end
