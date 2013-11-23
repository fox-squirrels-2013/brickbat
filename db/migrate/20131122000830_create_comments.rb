class CreateComments < ActiveRecord::Migration
	def change
		create_table :comments do |t|
			t.belongs_to :response
			t.string :content
		end
	end
end
