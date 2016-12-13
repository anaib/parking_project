class ParkingSpot < ApplicationRecord
  # Direct associations

  belongs_to :offer_user,
             :class_name => "User"

  # Indirect associations

  # Validations

end
