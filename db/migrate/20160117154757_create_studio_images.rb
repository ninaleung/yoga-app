class CreateStudioImages < ActiveRecord::Migration
  def change
    create_table :studio_images do |t|
      t.string :url
      t.integer :studio_id

      t.timestamps null: true
    end
  end
end
