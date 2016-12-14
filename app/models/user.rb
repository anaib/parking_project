class User < ApplicationRecord
  # Direct associations

  has_many   :spots_taken,
             :class_name => "PublicParkingSpot",
             :foreign_key => "accept_user_id",
             :dependent => :destroy

  has_many   :information,
             :dependent => :destroy

  has_many   :cars,
             :dependent => :destroy

  has_many   :parking_spots,
             :class_name => "PublicParkingSpot",
             :foreign_key => "offer_user_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :offer_users,
             :through => :spots_taken,
             :source => :offer_user

  has_many   :accept_users,
             :through => :parking_spots,
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
