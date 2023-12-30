class User < ApplicationRecord
  has_secure_password
  has_many :packages
  has_many :reservations

  validates :password, presence: true, length: { minimum: 6 }
end
