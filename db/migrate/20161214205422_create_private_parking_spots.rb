class CreatePrivateParkingSpots < ActiveRecord::Migration
  def change
    create_table :private_parking_spots do |t|
      t.string :address
      t.string :city
      t.string :zipcode
      t.date :pri_date
      t.time :pri_time
      t.integer :pri_price
      t.integer :pri_offer_user_id
      t.integer :pri_points
      t.integer :pri_accept_user_id

      t.timestamps

    end
  end
end
