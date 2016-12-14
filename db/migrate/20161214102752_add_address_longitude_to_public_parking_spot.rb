class AddAddressLongitudeToPublicParkingSpot < ActiveRecord::Migration[5.0]
  def change
    add_column :public_parking_spots, :address_longitude, :float
  end
end
