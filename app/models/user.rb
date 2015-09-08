class User < ActiveRecord::Base
	
	has_secure_password
	has_many :businesses

	has_attached_file :avatar,
	                 :styles => { :medium => "150x150>", :thumb => "44x44#" },
	                 :default_url => "/images/:style/missing.png"

	validates_attachment :avatar, :presence => true,
	                    :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
	                    :size => { :in => 0..10000.kilobytes }

end
