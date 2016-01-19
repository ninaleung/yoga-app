class SavedClass < ActiveRecord::Base
  belongs_to :user
  belongs_to :yoga_class

  def start_time
      self.yoga_class.start 
  end
end
