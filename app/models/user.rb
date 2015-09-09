class User < ActiveRecord::Base
	
	has_secure_password
	has_many :businesses, dependent: :destroy
	has_many :follows, dependent: :destroy
	# ask 
	# we can't use has_many :businesses because it's already used at the top so follow_businesses is an alias to go around it
	has_many :follow_businesses, through: :follows, source: :business

	has_attached_file :avatar,
	                 :styles => { :medium => "150x150>", :thumb => "44x44#" },
	                 :default_url => "/images/:style/missing.png"

	validates_attachment :avatar, :presence => true,
	                    :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
	                    :size => { :in => 0..10000.kilobytes }

end
