class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
  
  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to(:controller => 'access', :action => 'login')
      return false
    else
      return true
    end
  end

  def confirm_admin
    unless session[:admin]
      flash[:notice] = "You do not have permission to be there. This incident will be reported."
      redirect_to(:controller => 'public', :action => 'bad_person')
      return false
    else
      return true
    end
  end

  def confirm_captain
    unless session[:captain]
      flash[:notice] = "You do not have permission to be there. This incident will be reported."
      redirect_to(:controller => 'public', :action => 'bad_person')
      return false
    else
      return true
    end
  end
end
