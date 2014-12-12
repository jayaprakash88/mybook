class AddAvatarToUserProfiles < ActiveRecord::Migration
  def change
    add_column :user_profiles, :image, :string
  end
end
