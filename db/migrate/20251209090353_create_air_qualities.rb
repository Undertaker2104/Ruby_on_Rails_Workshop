class CreateAirQualities < ActiveRecord::Migration[8.0]
  def change
    create_table :air_qualities do |t|
      t.string :device_id
      t.float :pm25
      t.float :co2
      t.float :humidity
      t.integer :battery_level
      t.datetime :measured_at

      t.timestamps
    end
  end
end
