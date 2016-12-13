class AddAddressFormattedAddressToParkingSpot < ActiveRecord::Migration[5.0]
  def change
    add_column :parking_spots, :address_formatted_address, :string
  end
end
