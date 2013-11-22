class Post < ActiveRecord::Base
  attr_accessible :title, :body, :time_to_post

  validates_presence_of :title
  validates_presence_of :body

  has_many :responses
  belongs_to :user

  def time_left
  	self.time_to_post - Time.now.hour
  end

  def highest_rated_response

  	if self.responses.empty? 
  		return "no one likes me, and no one responded to my post!"
  	else
  		response = self.responses.order("votes_count desc").first
  		self.make_tweet(response)
  	end

  end

  def make_tweet(response)
  	"#{response.body} @#{self.mention} ##{self.hashtag}"
  end

end
