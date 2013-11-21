class Response < ActiveRecord::Base
  attr_accessible :body
  
  validates_presence_of :body

  belongs_to :post
end
