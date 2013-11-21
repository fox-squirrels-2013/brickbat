class CorrectResponse < ActiveRecord::Migration
  def change
    add_column :responses, :post_id, :integer
    remove_column :responses, :response_id
    change_column :responses, :votes, :integer, default: 0
  end
end
