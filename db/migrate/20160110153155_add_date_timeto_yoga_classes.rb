class AddDateTimetoYogaClasses < ActiveRecord::Migration
  def change
    add_column :yoga_classes, :start, :datetime
  end
end
