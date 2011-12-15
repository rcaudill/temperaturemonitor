class CreateTemperatureSensors < ActiveRecord::Migration
  def change
    create_table :temperature_sensors do |t|
      t.string :address
      t.string :temperature
      t.datetime :time

      t.timestamps
    end
  end
end
