class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :date
      t.string :time
      t.string :address
      t.text :description
      t.string :image
      t.boolean :complete
      t.integer :hosted_by

      t.timestamps
    end
  end
end
