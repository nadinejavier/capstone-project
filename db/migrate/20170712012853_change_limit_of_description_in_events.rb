class ChangeLimitOfDescriptionInEvents < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :description, :text, :maxlength => 4000
  end
end
