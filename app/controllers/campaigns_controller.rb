class CampaignsController < ApplicationController
	layout "site"
	def csv_import 
     @parsed_file=params[:dump][:file].read.gsub(/[a-z(),' ',-]/,'').split
     n=0
     bad=0
     
     @parsed_file.each do |row|
     c=Number.new
	    if row.size == 10
	     	c.number=row
     		c.campaign_id=params[:dump][:campaign]
     		if c.save
        		n=n+1
       			# GC.start if n%50==0
     		end
     	else
	 		bad+=1
	    end
	  end
     flash.now[:message]="CSV Import Successful,  #{n} new records added to data base, there were #{bad} bad records"
   end
     
  def index
    @campaigns = Campaign.find(:all, :conditions=>['site_id = ?', current_user.site.id])
  end
  
  def show
    @campaign = Campaign.find(params[:id])
  end
  
  def new
    @campaign = Campaign.new
  end
  
  def create
    @campaign = Campaign.new(params[:campaign])
    @campaign.site_id = current_user.site_id
    if @campaign.save
      flash[:notice] ="Successfully created campaign."
      redirect_to @campaign
    else
      render :action => 'new'
    end
  end
  
  def edit
    @campaign = Campaign.find(params[:id])
  end
  
  def update
    @campaign = Campaign.find(params[:id])
    @campaign.call_month = params[:call_month]
    if @campaign.update_attributes(params[:campaign])
      flash[:notice] = params.to_yaml #"Successfully updated campaign."
      redirect_to @campaign
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
    flash[:notice] = "Successfully destroyed campaign."
    redirect_to campaigns_url
  end
end
