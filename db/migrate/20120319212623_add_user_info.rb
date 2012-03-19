class AddUserInfo < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :photo, :string
    add_column :users, :destination, :string

  end
end
