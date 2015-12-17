class CreateYogaClasses < ActiveRecord::Migration
  def change
    create_table :yoga_classes do |t|
      t.string :name
      t.integer :studio_id
      t.date :date
      t.time :time
      t.integer :duration
      t.decimal :price, precision: 8, scale: 2
      t.string :level
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
