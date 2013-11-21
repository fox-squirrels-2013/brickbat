class User < ActiveRecord::Base
	has_many :votes
	has_many :posts
	has_many :responses
	validates :uid, presence: true
	def self.create_with_auth(auth)
		user = User.new 
		user.uid = auth.uid.to_i 
		user.token = auth.credentials.token 
		user.secret = auth.credentials.secret
		user.username = auth.info.nickname
		user.save
		user
	end

end