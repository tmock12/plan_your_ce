class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street_1
      t.string :street_2
      t.string :city
      t.string :state
      t.string :zip_code
      t.integer :course_id
      t.integer :provider_id

      t.timestamps
    end
  end
end
