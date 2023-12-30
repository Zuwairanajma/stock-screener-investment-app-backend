class Package < ApplicationRecord
    has_many :reservations
    has_many :users
end
