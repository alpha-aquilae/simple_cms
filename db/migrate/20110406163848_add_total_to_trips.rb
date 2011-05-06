class AddTotalToTrips < ActiveRecord::Migration
  def self.up
    add_column :trips, :total, :integer
  end

  def self.down
    remove_column :trips, :total
  end
end
