class YogaClass < ActiveRecord::Base
  belongs to :studio
  belongs to :user
end
