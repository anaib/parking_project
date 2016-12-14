class SpotsInformation < ApplicationRecord
  # Direct associations

  has_many   :spots_avaiables,
             :foreign_key => "info_id",
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
