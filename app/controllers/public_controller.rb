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

  def birthday
    @birthday = Date.new(2011, 01, 01)
  end
  
  def update_birthday
    @birthday = Date.new params[:date][:year].to_i, params[:date][:month].to_i, params[:date][:day].to_i
    if @birthday == Date.today
      flash[:good_birthday] = "Happy Birthday!<br />".html_safe + "Today is your birthday!"
    else
      flash[:bad_birthday] = "Today is not your birthday."
    end
      redirect_to :action => "birthday"
  end

end
