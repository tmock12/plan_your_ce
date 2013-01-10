class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.string :price
      t.string :instructor
      t.string :street_address_1
      t.string :street_address_2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone
      t.string :email
      t.string :credits
      t.string :max_attendance
      t.string :category
      t.text :audience
      t.date :start_date
      t.date :end_date
      t.integer :provider_id

      t.timestamps
    end
    add_index :courses, :category
  end
end
