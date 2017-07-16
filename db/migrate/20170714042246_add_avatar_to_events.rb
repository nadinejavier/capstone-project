class AddAvatarToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :avatar, :string
  end
end
