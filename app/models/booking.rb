class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :days, presence: true, numericality: {only_integer: true, greater_than: 0}
  validates :customers, presence: true, numericality: {only_integer: true, greater_than: 0}
  validates :total_amount, presence: true, numericality: {only_integer: true, greater_than: 0}
end
