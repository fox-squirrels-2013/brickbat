class Post < ActiveRecord::Base
  attr_accessible :title, :body, :time_to_post

  validates_presence_of :title
  validates_presence_of :body

  has_many :responses
  belongs_to :user

  before_save :update_time_to_post

  def time_left
  	self.time_to_post - Time.now.hour
  end

  def username
    self.user.username
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

  def self.check_time_left!(client)
    self.all.each do |post|
      if post.time_left <= 0 && post.tweet_success == false
        client.update(post.highest_rated_response)
        post.tweet_success = true
        post.save
      end
    end
  end

  private
  def update_time_to_post
    self.time_to_post = Time.now.hour + self.time_to_post.to_i
  end

end
