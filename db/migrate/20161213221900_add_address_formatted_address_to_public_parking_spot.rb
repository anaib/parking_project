class AddAddressFormattedAddressToPublicParkingSpot < ActiveRecord::Migration[5.0]
  def change
    add_column :public_parking_spots, :address_formatted_address, :string
  end
end
