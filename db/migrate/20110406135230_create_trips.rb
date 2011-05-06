class CreateTrips < ActiveRecord::Migration
  def self.up
    create_table :trips do |t|
      t.references :cdl
      t.string "cdl_name"
      # can also use: t.references :subject
      t.boolean "empty_1", :default => false
      t.boolean "empty_2", :default => false
      t.boolean "empty_3", :default => false
      t.boolean "empty_4", :default => false
      t.boolean "full_1", :default => false
      t.boolean "full_2", :default => false
      t.boolean "full_3", :default => false
      t.boolean "full_4", :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :trips
  end
end
