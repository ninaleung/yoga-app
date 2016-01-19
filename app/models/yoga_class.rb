class YogaClass < ActiveRecord::Base
  belongs_to :studio
  belongs_to :user
  has_many :saved_classes
  has_many :saved_by, through: :saved_classes, source: :user, foreign_key: "user_id"


  reverse_geocoded_by "studios.latitude", "studios.longitude"

  after_validation :geocode

  def parsed_date
    self.start.strftime("%A, %b %d, %Y")
  end

  def parsed_time
    self.start.strftime("%I:%M %p")
  end
end
