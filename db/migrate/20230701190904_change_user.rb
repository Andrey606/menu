class ChangeUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :password_digest
    add_column :users, :password, :string
  end
end
