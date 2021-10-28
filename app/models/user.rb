class User < ApplicationRecord
  has_many :rooms
  has_many :bookings
  
  has_secure_password
  
  mount_uploader :icon, ImageUploader
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {in: 8..16}, on: :create
  validates :password, length: {in: 8..16}, allow_blank: true, on: :update
end
