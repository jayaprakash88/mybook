class Photo < ActiveRecord::Base
	 attr_accessible :user_id,:user_image
	 validates :user_id,:presence=>true
	 belongs_to :user
	 mount_uploader :user_image, ImageUploader
end
