class User < ApplicationRecord
  # Direct associations

  has_many   :reservations,
             :dependent => :destroy

  has_many   :private_parking_spots_taken,
             :class_name => "PrivateParkingSpot",
             :foreign_key => "pri_accept_user_id",
             :dependent => :destroy

  has_many   :private_parking_spots_offer,
             :class_name => "PrivateParkingSpot",
             :foreign_key => "pri_offer_user_id",
             :dependent => :destroy

  has_many   :pub_spots_taken,
             :class_name => "PublicParkingSpot",
             :foreign_key => "pub_accept_user_id",
             :dependent => :destroy

  has_many   :information,
             :class_name => "SpotsInformation",
             :dependent => :destroy

  has_many   :pub_parking_spots_offer,
             :class_name => "PublicParkingSpot",
             :foreign_key => "pub_offer_user_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :pri_offer_users,
             :through => :private_parking_spots_taken,
             :source => :offer_user

  has_many   :pri_accept_users,
             :through => :private_parking_spots_offer,
             :source => :accept_user

  has_many   :offer_users,
             :through => :pub_spots_taken,
             :source => :offer_user

  has_many   :accept_users,
             :through => :pub_parking_spots_offer,
             :source => :accept_user

  # Validations

  validates :city, :presence => true

  validates :first_name, :presence => true

  validates :last_name, :presence => true

  validates :phone_number, :uniqueness => true

  validates :phone_number, :presence => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
