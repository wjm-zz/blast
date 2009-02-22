class UsersController < ApplicationController
  # If you want "remember me" functionality, add this before_filter to Application Controller
  before_filter :login_required

  def index
  	if self.logged_in? && self.current_user.role.rights.exists?(1)
    	@users = User.find(:all,:conditions=>['login NOT LIKE ?',"su"])
    else
    	flash[:notice] = "Wrong Answer!"
    	redirect_to(logout_path)
    end
  end
   
  def edit
  	@user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated User."
      redirect_to users_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
  	@user = User.find(params[:id])
    @user.destroy
    flash[:notice] = @user.login + " has been deleted"
    redirect_to users_url
  end
end
