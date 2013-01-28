class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.string :location
      t.string :iata_code

      t.timestamps
    end

    add_index :airports, :location
  end
end
