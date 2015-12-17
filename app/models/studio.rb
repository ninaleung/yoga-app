class Studio < ActiveRecord::Base
  has many :yoga_classes
  belongs to :user
end
