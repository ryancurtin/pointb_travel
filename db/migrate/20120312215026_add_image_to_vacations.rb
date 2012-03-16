class AddImageToVacations < ActiveRecord::Migration
  def change
    add_column :vacations, :image, :string

  end
end
