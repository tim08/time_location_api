class AddIndexTimeZoneToLocations < ActiveRecord::Migration[5.0]
  def change
    add_index :locations, :time_zone, unique: true
  end
end
