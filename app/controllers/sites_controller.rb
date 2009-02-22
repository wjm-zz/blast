class SitesController < ApplicationController
	
	layout :user_layout

  def index
    @sites = Site.all
  end

  def customer
    @customer = Site.find(current_user.site_id)
  end
  
  def show
    @site = Site.find(params[:id])
  end
  
  def new
    @site = Site.new
  end
  
  def create
    @site = Site.new(params[:site])
    if @site.save
      flash[:notice] = "Successfully created site."
      redirect_to @site
    else
      render :action => 'new'
    end
  end
  
  def edit
    @site = Site.find(params[:id])
  end
  
  def update
    @site = Site.find(params[:id])
    if @site.update_attributes(params[:site])
      flash[:notice] = "Successfully updated site."
      redirect_to @site
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    flash[:notice] = "Successfully destroyed site."
    redirect_to sites_url
  end
  
protected

def user_layout
  if current_user.site.name == "Admin"
   "application"
  else
     "site"
  end
end
end