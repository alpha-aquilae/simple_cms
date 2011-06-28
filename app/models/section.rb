require 'position_mover'
class Section < ActiveRecord::Base
	
	include PositionMover

  belongs_to :page
  has_many :section_edits
  has_many :editors, :through => :section_edits, :class_name => "User"

  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :sorted, order('sections.position ASC')
  
  CONTENT_TYPES =   ['text', 'HTML']

  validates :name, :presence => true, :length => {:maximum => 255}
  validates :content, :presence => true
  validates_inclusion_of :content_type, :in => CONTENT_TYPES,
    :message => "must be one of: #{CONTENT_TYPES.join(', ')}"

 private
  
  def position_scope
  	"section.page_id = #{page_id.to_i}"
  end
  
end
