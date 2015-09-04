class RemoveCurrentCapacityFromLocations < ActiveRecord::Migration
  def change
    remove_column :locations, :current_capacity, :integer
  end
end
