class RemoveDateFromYogaClasses < ActiveRecord::Migration
  def change
    remove_column :yoga_classes, :date, :date
    remove_column :yoga_classes, :time, :time
  end
end
