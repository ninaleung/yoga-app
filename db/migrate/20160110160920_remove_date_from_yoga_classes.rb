class RemoveDateFromYogaClasses < ActiveRecord::Migration
  def change
    remove_column :yoga_classes, :date
    remove_column :yoga_classes, :time
  end
end
