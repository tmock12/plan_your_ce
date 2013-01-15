class RemoveAddressFieldsFromProvider < ActiveRecord::Migration
  def change
    remove_column :providers, :street_address_1
    remove_column :providers, :street_address_2
    remove_column :providers, :city
    remove_column :providers, :state
    remove_column :providers, :zip_code
  end
end
