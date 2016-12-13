class Information < ApplicationRecord
  # Direct associations

  has_many   :spots_avaiables,
             :foreign_key => "neighborhood_id",
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
