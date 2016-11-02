class AddIndexNameToLocations < ActiveRecord::Migration[5.0]
  def change
    add_index :locations, :name, unique: true
  end
end
