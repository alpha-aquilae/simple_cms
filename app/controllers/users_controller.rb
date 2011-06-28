class UsersController < ApplicationController

layout 'admin'
   before_filter :confirm_logged_in
   before_filter :confirm_admin
  def index
    list
    render('list')
  end
  
  def list
    @users = User.sorted
  end
  
  def new
    @user = User.new
  end
  
  def create
    # Instantiate a new object using form parameters
    @user = User.new(params[:user])
    # Save the object
    if @user.save
      # If save succeeds, redirect to the list action
      flash[:notice] = "Created User."
      redirect_to(:action => 'list')
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    # Find object using form parameters
    @user = User.find(params[:id])
    # Update the object
    if @user.update_attributes(params[:user])
      # If update succeeds, redirect to the list action
      flash[:notice] = "User updated."
      redirect_to(:action => 'list')
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end
  
  def delete
    @user = User.find(params[:id])
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "User destroyed."
    redirect_to(:action => 'list')
  end
    
end
