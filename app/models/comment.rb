class Comment < ActiveRecord::Base
	validates :content, presence: true
	belongs_to :response
  attr_accessible :content
end