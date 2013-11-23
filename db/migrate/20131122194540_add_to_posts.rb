class AddToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :time_to_post, :integer
  	add_column :posts, :tweet_success, :boolean, default: false
  	add_column :posts, :mention, :string
  	add_column :posts, :hashtag, :string
  end
end
