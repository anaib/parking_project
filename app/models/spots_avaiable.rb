class SpotsAvaiable < ApplicationRecord
  # Direct associations

  belongs_to :neighborhood,
             :class_name => "Information"

  # Indirect associations

  # Validations

end
