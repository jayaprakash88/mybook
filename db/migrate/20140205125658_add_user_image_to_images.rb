class AddUserImageToImages < ActiveRecord::Migration
  def change
    add_column :images, :user_image, :string
  end
end
