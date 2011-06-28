class CaptainReports < ActiveRecord::Migration
  def self.up
    create_table :captain_reports do |t|
      t.integer "user_id"
      t.string "route"
      t.datetime "date"
      t.integer "number_salvations"
      t.integer "rider_attendance"
      t.integer "worker_attendance"
      t.integer "number_baptisms"
      t.integer "number_first_time_visitors"
      t.integer "number_night_riders"
      t.string "comments"
      t.boolean "complete"
      t.timestamps
    end
  end

  def self.down
    drop_table :captain_reports
  end

end