class SavedClass < ActiveRecord::Base
  belongs_to :user
  belongs_to :yoga_class

end
