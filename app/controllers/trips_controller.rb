class TripsController < ApplicationController
   layout 'admin'
 before_filter :confirm_logged_in
  def index
    list
    render('list')
  end

  def list
    @trips = Trip.all
  end

  def show
    #@driver = Cdl.find(params[:id])
    @trip = Trip.find_by_cdl_id(params[:cdl_id])
  end

  def new
    @trip = Trip.new
    @trip_count = Trip.count + 1
  end

  def create
    # Instantiate a new object using form parameters
    @trip = Trip.new(params[:trip])
    # Save the object
    if @trip.save
      # If save succeeds, redirect to the list action
      flash[:notice] = "Record created."
      redirect_to(:controller => 'cdls', :action => 'list')
    else
      # If save fails, redisplay the form so user can fix problems
      @trip_count = Trip.count +1
      render('new')
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    # Find object using form parameters
    @trip = Trip.find(params[:id])
    # Update the object
    if @trip.update_attributes(params[:trip])
      # If update succeeds, redirect to the list action
      flash[:notice] = "Record updated."
      redirect_to(:controller => 'cdls', :action => 'list')
    else
      # If save fails, redisplay the form so user can fix problems
      @trip_count = Trip.count
      render('edit')
    end
  end

  def delete
    @trip = Trip.find(params[:id])
  end

  def destroy
    Trip.find(params[:id]).destroy
    flash[:notice] = "Record destroyed."
    redirect_to(:action => 'list')
  end
end
