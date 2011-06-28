class AccessController < ApplicationController
  
  layout 'admin'
  
  before_filter :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  def index
    menu
    render('menu')
  end

  def menu
  end

  def login
  end

  def attempt_login
    authorized_user = User.authenticate(params[:username], params[:password])
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      session[:admin] = authorized_user.admin
      session[:captain] = authorized_user.captain
      flash[:notice] = "You are now logged in."
      redirect_to(:controller =>"public", :action => 'index')
    else
      flash[:error] = "Invalid Input."
      redirect_to(:action => 'login')
    end
  end
  
  def logout
    session[:user_id] = nil
    session[:username] = nil
    session[:admin] = nil
    session[:captain] = nil
    flash[:notice] = "You are now logged out."
    redirect_to(:controller => 'public', :action => "index")
  end
  
 
end
