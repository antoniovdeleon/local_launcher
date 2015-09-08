class AddAttachmentAvatarToBusinesses < ActiveRecord::Migration
  def self.up
    change_table :businesses do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :businesses, :avatar
  end
end
