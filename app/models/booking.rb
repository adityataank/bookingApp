class Booking < ApplicationRecord
    # validates :place, presence: true
    # validates :movie, presence: true
    # validates :date, presence: true
    # validates :time, presence: true
    belongs_to :user
    has_one_attached :payment_proof
end 