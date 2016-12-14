class PublicParkingSpot < ApplicationRecord
  # Direct associations

  belongs_to :accept_user,
             :class_name => "User",
             :foreign_key => "pub_accept_user_id"

  belongs_to :offer_user,
             :class_name => "User",
             :foreign_key => "pub_offer_user_id"

  # Indirect associations

  # Validations

end
