class Studio < ActiveRecord::Base
  has_many :yoga_classes
  has_many :studio_images
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
