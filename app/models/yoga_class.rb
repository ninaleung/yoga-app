class YogaClass < ActiveRecord::Base
  belongs_to :studio
  belongs_to :user

  reverse_geocoded_by "studios.latitude", "studios.longitude"

  after_validation :geocode
end
