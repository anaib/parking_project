class CreatePrivateParkingSpots < ActiveRecord::Migration
  def change
    create_table :private_parking_spots do |t|
      t.string :address
      t.string :city
      t.string :zipcode
      t.date :date
      t.string :starting_time
      t.string :duration
      t.integer :points
      t.string :car_type
      t.text :description
      t.integer :offer_user_id
      t.integer :accept_user_id
      t.string :parking_price

      t.timestamps

    end
  end
end
