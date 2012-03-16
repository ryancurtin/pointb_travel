class CreateVacations < ActiveRecord::Migration
  def change
    create_table :vacations do |t|
      t.string :destination
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
