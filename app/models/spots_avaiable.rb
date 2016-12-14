class SpotsAvaiable < ApplicationRecord
  # Direct associations

  belongs_to :neighborhood,
             :class_name => "SpotsInformation",
             :foreign_key => "info_id"

  # Indirect associations

  # Validations

end
