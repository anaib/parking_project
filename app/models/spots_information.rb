class SpotsInformation < ApplicationRecord
  # Direct associations

  belongs_to :user

  # Indirect associations

  # Validations

  validates :streets, :presence => true

  validates :zipcode, :presence => true

end
