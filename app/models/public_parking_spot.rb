class PublicParkingSpot < ApplicationRecord
  # Direct associations

  belongs_to :accept_user,
             :class_name => "User"

  belongs_to :offer_user,
             :class_name => "User"

  # Indirect associations

  # Validations

  validates :address, :presence => true

  validates :city, :presence => true

  validates :starting_time, :presence => true

  validates :zipcode, :presence => true

end
