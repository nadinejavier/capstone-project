class ChangeLimitOfDescription < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :description, :text, :limit => 4000
  end
end
