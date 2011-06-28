class CaptainReportsController < ApplicationController

  layout 'admin'
  before_filter :confirm_logged_in
  before_filter :confirm_captain
  before_filter :confirm_admin, :except => [:list, :show, :edit, :update]
   
  def index
    @reports = CaptainReport.sorted.limit(50).all
  end
  
  def list
    @complete_reports = CaptainReport.complete.sorted.where(:user_id => session[:user_id])
    @incomplete_reports = CaptainReport.incomplete.sorted.where(:user_id => session[:user_id])
  end
  
  def show
    @report = CaptainReport.find(params[:id])
  end
  
  def new
    @report = CaptainReport.new(:user_id => session[:user_id])
  end
  
  def create
    @report = CaptainReport.new(params[:report])
    if @report.save
      flash[:notice] = "created new report"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end
  
  def edit
    @report = CaptainReport.find(params[:id])
  end
  
  def admin_edit
    @report = CaptainReport.find(params[:id])
  end
  
  def update
    @report = CaptainReport.find(params[:id])
    @report.complete = true
    if @report.update_attributes(params[:report])
      flash[:notice] = "Thank you for your hard work and dedication."
      redirect_to(:action => 'list')
    else
      render('edit')
    end
  end

  def admin_update
    @report = CaptainReport.find(params[:id])
    if @report.update_attributes(params[:report])
      flash[:notice] = "updated."
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end
  
  def delete
    @report = CaptainReport.find(params[:id])
  end
  
  def destroy
    CaptainReport.find(params[:id]).destroy
    flash[:notice] = "Report destroyed."
    redirect_to(:action => 'list')
  end

end