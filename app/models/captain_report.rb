class CaptainReport < ActiveRecord::Base

  validates :route, :presence => true, :length => {:maximum => 25}
  validates :date, :presence => true
  validates :number_salvations, :presence => true
  validates :rider_attendance, :presence => true
  validates :worker_attendance, :presence => true
  validates :number_baptisms, :presence => true
  validates :number_first_time_visitors, :presence => true
  validates :number_night_riders, :presence => true

  belongs_to :user

  scope :complete, where(:complete => true)
  scope :incomplete, where(:complete => false)
  scope :sorted, order('captain_reports.date DESC')
  
end
