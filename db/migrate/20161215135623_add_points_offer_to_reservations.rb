class AddPointsOfferToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :accept_points, :integer
    add_column :reservations, :offer_points, :integer
  end
end
