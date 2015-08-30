class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :capacity
      t.integer :current_capacity

      t.timestamps null: false
    end
  end
end
