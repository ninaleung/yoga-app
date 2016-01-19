class AddSignUpToStudio < ActiveRecord::Migration
  def change
    add_column :studios, :sign_up_link, :string
  end
end
