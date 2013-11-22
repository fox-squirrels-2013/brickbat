class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :uid
			t.string :token
			t.string :secret
			t.string :username
  	end
  end
end
