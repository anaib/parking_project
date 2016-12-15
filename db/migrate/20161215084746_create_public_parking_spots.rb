class CreatePublicParkingSpots < ActiveRecord::Migration
  def change
    create_table :public_parking_spots do |t|
      t.string :address
      t.string :city
      t.string :zipcode
      t.time :time
      t.string :car_type
      t.integer :pub_offer_user_id
      t.string :max_time
      t.integer :price
      t.text :description
      t.integer :pub_accept_user_id
      t.integer :points

      t.timestamps

    end
  end
end
