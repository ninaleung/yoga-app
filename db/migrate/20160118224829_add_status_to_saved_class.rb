class AddStatusToSavedClass < ActiveRecord::Migration
  def change
    add_column :saved_classes, :status, :string
  end
end
