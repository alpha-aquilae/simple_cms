class AlterCaptainReports < ActiveRecord::Migration
  def self.up
    change_column_default :captain_reports, :complete, false
  end

  def self.down
  end

end