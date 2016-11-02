class CreateTimeStamps < ActiveRecord::Migration[5.0]
  def change
    create_table :time_stamps do |t|
      t.datetime :signature

      t.timestamps
    end
  end
end
