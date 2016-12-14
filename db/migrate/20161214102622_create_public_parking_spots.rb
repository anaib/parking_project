class CreatePublicParkingSpots < ActiveRecord::Migration
  def change
    create_table :public_parking_spots do |t|
      t.string :address
      t.string :city
      t.integer :zipcode
      t.time :time
      t.string :car_type
      t.integer :pub_offer_user_id
      t.string :type_of_parking
      t.string :max_time
      t.string :price
      t.text :description
      t.integer :pub_accept_user_id
      t.string :neighborhood
      t.boolean :already_paid
      t.string :paid_time

      t.timestamps

    end
  end
end
