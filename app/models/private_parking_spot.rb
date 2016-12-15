class PrivateParkingSpot < ApplicationRecord
  # Direct associations

  belongs_to :accept_user,
             :class_name => "User",
             :foreign_key => "pri_accept_user_id"

  belongs_to :offer_user,
             :class_name => "User",
             :foreign_key => "pri_offer_user_id"

  # Indirect associations

  # Validations

  validates :address, :presence => true

  validates :city, :presence => true

  validates :points, :presence => true

  validates :time, :presence => true

  validates :zipcode, :presence => true

end
