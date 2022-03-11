class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title, limit: 75
      t.string :description, limit: 750
      t.datetime :dateTime
      t.string :location
      t.integer :price
      t.integer :capacity

      t.timestamps
    end
  end
end
