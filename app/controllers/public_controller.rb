class PublicController < ApplicationController
  
	layout 'public'
	
	before_filter :setup_navigation
	
	def index
		# intro text
  end

  def show
    	@page = Page.where('visible').first
    	@cdl = Cdl.first
    	redirect_to(:action => 'index') unless @page || @cdl
    end
    
  def show_cdls
    	@cdl = Cdl.first
    	redirect_to(:action => 'index') unless @cdl
  end 

	private
	
	def setup_navigation
		@subjects = Subject.visible.sorted
		@cdls = Cdl.all
	end

end
