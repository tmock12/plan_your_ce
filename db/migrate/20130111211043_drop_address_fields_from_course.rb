class DropAddressFieldsFromCourse < ActiveRecord::Migration
  def change
    remove_column :courses, :street_address_1
    remove_column :courses, :street_address_2
    remove_column :courses, :city
    remove_column :courses, :state
    remove_column :courses, :zip_code
  end
end
