class PublicController < ApplicationController
  
	layout 'public'
	
	def index
		# intro text
  end

  def show
      @subjects = Subject.visible.sorted
    	@page = Page.where('visible').first
    	redirect_to(:action => 'index') unless @page || @cdl
    end
    
  def cdls
		@cdls = Cdl.all
  end
  
  def show_cdls
    	@cdl = Cdl.find_by_id(params[:id])
    	redirect_to(:action => 'index') unless @cdl
  end 

  def bad_person
  
  end

end
