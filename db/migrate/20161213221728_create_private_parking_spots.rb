class CreatePrivateParkingSpots < ActiveRecord::Migration
  def change
    create_table :private_parking_spots do |t|

      t.timestamps

    end
  end
end
