require 'position_mover'
class Subject < ActiveRecord::Base

	include PositionMover

  has_many :pages

  validates :name, :presence => true, :length => {:maximum => 200}

  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :sorted, order('subjects.position ASC')
  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}
  
end