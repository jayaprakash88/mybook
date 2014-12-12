class AddUserIdToUserProfiles < ActiveRecord::Migration
  def change
    add_column :user_profiles, :user_id, :integer
    add_column :user_profiles, :description, :string
  end
end
