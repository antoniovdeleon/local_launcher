class AddUserIdToBusinesses < ActiveRecord::Migration
	change_table :businesses do |t|
	  t.belongs_to :user
	end
end
