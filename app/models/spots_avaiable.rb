class SpotsAvaiable < ApplicationRecord
  # Direct associations

  belongs_to :neighborhood,
             :class_name => "Information",
             :foreign_key => "zipcode"

  # Indirect associations

  # Validations

end
