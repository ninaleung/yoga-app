class CreateStudios < ActiveRecord::Migration
  def change
    create_table :studios do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.string :website
      t.integer :user_id #studio owner

      t.timestamps null: false
    end
  end
end
