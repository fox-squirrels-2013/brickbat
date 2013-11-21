class Post < ActiveRecord::Base
  attr_accessible :title, :body

  validates_presence_of :title
  validates_presence_of :body
end
