class CreateWeeks < ActiveRecord::Migration
  def self.up
    create_table :weeks do |t|
      t.string      "name"
      t.datetime    "sunday_start"
      t.datetime    "sunday_end"
      t.datetime    "monday_start"
      t.datetime    "monday_end"
      t.datetime    "tuesday_start"
      t.datetime    "tuesday_end"
      t.datetime    "wednesday_start"
      t.datetime    "wednesday_end"
      t.datetime    "thursday_start"
      t.datetime    "thursday_end"
      t.datetime    "friday_start"
      t.datetime    "friday_end"
      t.datetime    "saturday_start"
      t.datetime    "saturday_end"
      t.timestamps
    end
  end

  def self.down
    drop_table :weeks
  end
end
