class RenameLocationToTitleOnAirports < ActiveRecord::Migration
  def change
    rename_column :airports, :location, :title
  end
end
