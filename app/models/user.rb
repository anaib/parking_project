class User < ApplicationRecord
  # Direct associations

  has_many   :information,
             :dependent => :destroy

  has_many   :cars,
             :dependent => :destroy

  has_many   :parking_spots,
             :foreign_key => "offer_user_id",
             :dependent => :destroy

  # Indirect associations

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
