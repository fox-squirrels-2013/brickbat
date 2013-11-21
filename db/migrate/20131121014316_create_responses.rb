class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :body
      t.belongs_to :post
      t.integer :votes_count, default: 0

      t.timestamps
    end
  end
end
