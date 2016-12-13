class CreateParkingSpots < ActiveRecord::Migration
  def change
    create_table :parking_spots do |t|
      t.string :address
      t.string :city
      t.integer :zipcode
      t.time :time
      t.string :car_type
      t.integer :offer_user_id
      t.string :type_of_parking
      t.string :max_time
      t.string :price
      t.text :description
      t.integer :accept_user_id
      t.string :neighborhood

      t.timestamps

    end
  end
end
