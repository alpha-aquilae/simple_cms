class Cdl < ActiveRecord::Base

  belongs_to :admin_user
  has_many :trips
  validates_presence_of :name
end