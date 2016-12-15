class CreatePublicParkingSpots < ActiveRecord::Migration
  def change
    create_table :public_parking_spots do |t|
      t.string :address
      t.string :city
      t.string :zipcode
      t.string :date
      t.string :starting_time
      t.string :max_time
      t.string :car_type
      t.integer :street_parking_price
      t.text :description
      t.integer :pub_offer_user_id
      t.integer :points
      t.integer :offer_user_id
      t.integer :accept_user_id

      t.timestamps

    end
  end
end
