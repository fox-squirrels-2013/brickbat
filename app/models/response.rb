class Response < ActiveRecord::Base
  attr_accessible :body, :post_id
  validates_presence_of :body

  has_many :votes
  belongs_to :user
  belongs_to :post

  def vote_total
    votes = self.votes.map(&:vote)
    value = 0
    votes.each do |v|
      value += 1 if v == 'Up'
      value -= 1 if v == 'Down'
    end
    value
  end
end
