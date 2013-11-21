class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :body
      t.belongs_to :response
      t.integer :votes

      t.timestamps
    end
  end
end
