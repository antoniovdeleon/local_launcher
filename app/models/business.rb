class Business < ApplicationRecord

	# before_create do
	#    throw(:abort) if you_need_to_halt
	#  end
	
	belongs_to :user, required: true # deprecated => `required: true`
	has_many :follows, dependent: :destroy
	has_many :deals, dependent: :destroy
	has_many :users, through: :follows

	has_attached_file :avatar,
	                  :styles => { :medium => "150x150>", :thumb => "44x44#" },
	                  :default_url => "/images/:style/missing.png"

	validates_attachment :avatar,
	                     :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
	                     :size => { :in => 0..10000.kilobytes }

	# todo
	# add validations
end
