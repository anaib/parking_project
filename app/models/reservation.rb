class Reservation < ApplicationRecord
  # Direct associations

  belongs_to :accept_user,
             :class_name => "User"

  belongs_to :user,
             :foreign_key => "offer_user_id"

  # Indirect associations

  # Validations

end
