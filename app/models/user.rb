class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  require 'carrierwave/orm/activerecord'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email,:status, :password, :password_confirmation,:profile_image, :remember_me,:username
  validates :username,:presence=>true
  has_many :user_profiles


   attr_accessible :profile_image
	 
	 
	  mount_uploader :avatar, AvatarUploader

    def online_friends
      friends=User.where('status =? and id !=?', true,self.id)
    end
end
