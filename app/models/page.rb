require 'position_mover'
class Page < ActiveRecord::Base

	include PositionMover

  validates :name, :presence => true, :length => {:maximum => 255}
  validates :permalink, :presence => true, :length => {:within => 3..255}, :uniqueness => true


  belongs_to :subject
  has_many :sections
  has_and_belongs_to_many :editors, :class_name => "AdminUser"

  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :sorted, order('pages.position ASC')
  
  private
  
  def position_scope
  	"pages.subject_id = #{subject_id.to_i}"
  end
  
end
