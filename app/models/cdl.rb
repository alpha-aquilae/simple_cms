class Cdl < ActiveRecord::Base

  belongs_to :user
  has_many :trips
  validates_presence_of :name
end