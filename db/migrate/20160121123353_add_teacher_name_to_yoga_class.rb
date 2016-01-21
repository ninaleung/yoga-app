class AddTeacherNameToYogaClass < ActiveRecord::Migration
  def change
    add_column :yoga_classes, :teacher_name, :string
  end
end
