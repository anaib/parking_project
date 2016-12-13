class AddAddressLatitudeToParkingSpot < ActiveRecord::Migration[5.0]
  def change
    add_column :parking_spots, :address_latitude, :float
  end
end
