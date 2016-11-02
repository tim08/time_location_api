class SetDefaultTimeZoneOnLocations < ActiveRecord::Migration[5.0]
  def change
    change_column :locations, :time_zone, :string, :default => 'UTC'
  end
end
