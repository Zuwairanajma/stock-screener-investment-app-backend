class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :package

    validates :user_id, uniqueness: { scope: :package_id, message: 'has already made a reservation for this tutorial' }
end
