class RemoveStartTimeFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :start_time, :string
  end
end
