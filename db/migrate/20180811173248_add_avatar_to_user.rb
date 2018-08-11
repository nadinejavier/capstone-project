class AddAvatarToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :image, :string
    add_column :events, :image, :string
  end
end
