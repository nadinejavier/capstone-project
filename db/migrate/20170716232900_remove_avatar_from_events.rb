class RemoveAvatarFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :avatar, :string
  end
end
