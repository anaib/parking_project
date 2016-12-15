class AddNeighToPrivateParkingSpots < ActiveRecord::Migration[5.0]
  def change
    add_column :private_parking_spots, :neigh, :string
    add_column :private_parking_spots, :string, :string
  end
end
