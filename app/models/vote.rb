class Vote < ActiveRecord::Base
	belongs_to :user
	belongs_to :response

	attr_accessible :user_id, :response_id, :vote
	
	validates :user_id, presence: true
	validates :response_id, presence: true
	validates :vote, presence: true

end