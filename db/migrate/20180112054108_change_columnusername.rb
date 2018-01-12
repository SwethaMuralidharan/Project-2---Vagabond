class ChangeColumnusername < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :username, :firstname
    add_column :users, :lastname, :string
  end
end
