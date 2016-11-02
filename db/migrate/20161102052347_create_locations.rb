class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.decimal :latitude
      t.decimal :longitude
      t.string :time_zone

      t.timestamps
    end
  end
end
