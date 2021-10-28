class Room < ApplicationRecord
  belongs_to :user
  has_many :bookings
  
  mount_uploader :image, ImageUploader
  
  def self.search(keyword)
    if keyword
      Room.where("title like ? or address like ? or information like ?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%")
    else
      Room.all
    end
  end
  
  def self.search_area(keyword)
    if keyword
      Room.where("address like ?", "%#{keyword}%")
    else
      Room.all
    end
  end
  
  validates :title, presence: true
  validates :address, presence: true
  validates :fee, presence: true, numericality: {only_integer: true, greater_than: 0}
  validates :information, presence: true
  validates :image, presence: true
end
