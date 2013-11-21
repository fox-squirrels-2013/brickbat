class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.belongs_to :post
      t.belongs_to :user
      t.string :body
      t.integer :votes_count, default: 0

      t.timestamps
    end
  end
end
