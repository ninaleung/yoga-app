class AddLogoToStudios < ActiveRecord::Migration
  def change
    add_column :studios, :logo_url, :string
    add_column :studios, :description, :text
  end
end
