class NumbersController < ApplicationController
		layout "site"
  def index
    @numbers = Number.all
  end
  
  def show
  	@number = Number.search(params[:search], params[:page],params[:id])
    @name = Campaign.find(params[:id])
  end
  
  def new
    @number = Number.new
  end
  
  def create
    @number = Number.new(params[:number])
    if @number.save
      flash[:notice] = "Successfully created number."
      redirect_to @number
    else
      render :action => 'new'
    end
  end
  
  def edit
    @number = Number.find(params[:id])
  end
  
  def update
    @number = Number.find(params[:id])
    if @number.update_attributes(params[:number])
      flash[:notice] = "Successfully updated number."
      redirect_to @number
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @number = Number.find(params[:id])
    @number.destroy
    flash[:notice] = "Successfully destroyed number."
    redirect_to number_path(@number.campaign_id)
  end
end
