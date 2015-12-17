class Studio < ActiveRecord::Base
  has_many :yoga_classes
  belongs_to :user
end
