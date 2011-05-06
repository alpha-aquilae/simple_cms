class CdlsController < ApplicationController

 layout 'admin'
  before_filter :confirm_logged_in 
  def index
    list
    render('list')
  end
  
  def list
    @cdls = Cdl.order("cdls.position ASC")
  end
  
  def show
    @cdl = Cdl.find(params[:id])
  end
  
  def new
    @cdl = Cdl.new
    @cdl_count = Cdl.count + 1
  end
  
  def create
    # Instantiate a new object using form parameters
    @cdl = Cdl.new(params[:cdl])
    # Save the object
    if @cdl.save
      # If save succeeds, redirect to the list action
      flash[:notice] = "Prospect created."
      redirect_to(:action => 'list')
    else
      # If save fails, redisplay the form so user can fix problems
      @cdl_count = Cdl.count +1
      render('new')
    end
  end
  
  def edit
    @cdl = Cdl.find(params[:id])
    @cdl_count = Cdl.count
  end
  
  def update
    # Find object using form parameters
    @cdl = Cdl.find(params[:id])
    # Update the object
    if @cdl.update_attributes(params[:cdl])
      # If update succeeds, redirect to the list action
      flash[:notice] = "Prospect updated."
      redirect_to(:action => 'show', :id => @cdl.id)
    else
      # If save fails, redisplay the form so user can fix problems
      @cdl_count = Cdl.count
      render('edit')
    end
  end
  
  def delete
    @cdl = Cdl.find(params[:id])
  end
  
  def destroy
    Cdl.find(params[:id]).destroy
    flash[:notice] = "Prospect destroyed."
    redirect_to(:action => 'list')
  end

end
