class RightsController < ApplicationController
	before_filter :login_required
	
  def index
    @rights = Right.all
  end
  
  def show
    @right = Right.find(params[:id])
  end
  
  def new
    @right = Right.new
  end
  
  def create
    @right = Right.new(params[:right])
    if @right.save
      flash[:notice] = "Successfully created right."
      redirect_to rights_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @right = Right.find(params[:id])
  end
  
  def update
    @right = Right.find(params[:id])
    if @right.update_attributes(params[:right])
      flash[:notice] = "Successfully updated right."
      redirect_to rights_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @right = Right.find(params[:id])
    @right.destroy
    flash[:notice] = "Successfully destroyed right."
    redirect_to rights_url
  end
end
