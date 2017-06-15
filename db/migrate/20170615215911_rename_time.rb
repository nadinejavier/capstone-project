class RenameTime < ActiveRecord::Migration[5.0]
  def change
    rename_column :events, :time, :start_time
  end
end
