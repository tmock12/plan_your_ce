class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :street_address_1
      t.string :street_address_2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone
      t.string :fax
      t.string :website
      t.string :email
      t.string :cerp_number
      t.string :password_digest

      t.timestamps
    end
  end
end
