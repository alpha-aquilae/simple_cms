class WeeksController < ApplicationController
  before_filter :confirm_logged_in
  before_filter :confirm_admin
  layout 'admin'

  def index
    @weeks = Week.order(:sunday_start).all
  end

  def new
    @week = Week.new
  end

  def create
    @week = Week.new params[:week]
    if @week.save
      flash[:notice] = "Created log."
      redirect_to :action => 'index'
    else
      redirect_to :action => 'new'
    end 
  end 

  def edit
    @week = Week.find params[:id]
  end

  def update
    @week = Week.find params[:week_id]
    if @week.update_attributes params[:week]
      flash[:notice] = "Updated log."
      redirect_to :action => 'index'
    else
      redirect_to :action => 'edit'
    end
  end

  def mail
    @hours = Week.find(params[:week_id])
    if Notifier.work_hours(@hours).deliver
      flash[:notice] = "Your email was sent."
      redirect_to :action => "index"
    else 
      redirect_to :action => "index"
    end
  end

  def destroy
    Week.find(params[:week_id]).destroy
    flash[:notice] = "Your log has been terminated."
    redirect_to :action => "index"
  end

end