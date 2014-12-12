class Image < ActiveRecord::Base

	 attr_accessible :user_id,:photo,:avatar
	 #validates :user_id,:presence=>true
	 belongs_to :user
	 mount_uploader :avatar, AvatarUploader
end
