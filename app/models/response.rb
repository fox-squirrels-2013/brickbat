class Response < ActiveRecord::Base
  attr_accessible :body, :post_id
  
  validates_presence_of :body

  belongs_to :post
end
