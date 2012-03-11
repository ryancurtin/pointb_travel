class KillHotels < ActiveRecord::Migration
  def up
    drop_table :hotels
  end

  def down
  end
end
