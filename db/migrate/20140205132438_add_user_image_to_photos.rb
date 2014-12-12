class AddUserImageToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :user_image, :string
  end
end
