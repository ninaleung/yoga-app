class AddStyleToYogaClass < ActiveRecord::Migration
  def change
    add_column :yoga_classes, :style, :string
  end
end
