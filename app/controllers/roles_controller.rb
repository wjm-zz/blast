class RolesController < ApplicationController
	
	before_filter :login_required

  def index
    @roles = Role.find(:all, :conditions => ['name NOT LIKE ?',"Super User"])
  end
  
  def show
    @role = Role.find(params[:id])
  end
  
  def new
    @role = Role.new
  end
  
  def create
    @role = Role.new(params[:role])
    if @role.save
      flash[:notice] = "Successfully created role."
      redirect_to roles_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @role = Role.find(params[:id])
  end
  
  def update
    @role = Role.find(params[:id])
    if @role.update_attributes(params[:role])
      flash[:notice] = "Successfully updated role."
      redirect_to @role
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @role = Role.find(params[:id])
    @role.destroy
    flash[:notice] = "Successfully destroyed role."
    redirect_to roles_url
  end
end
