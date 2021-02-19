class AddImgToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_picture_user, :string
  end
end
