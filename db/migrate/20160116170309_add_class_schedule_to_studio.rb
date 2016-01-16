class AddClassScheduleToStudio < ActiveRecord::Migration
  def change
    add_column :studios, :class_schedule_link, :string
  end
end
