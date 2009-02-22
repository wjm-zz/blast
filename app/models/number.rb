class Number < ActiveRecord::Base
	belongs_to :campaign, :counter_cache => true
	
def self.search(search, page, campaign)
  paginate :per_page => 15, :page => page,
           :conditions => ['number like ? AND campaign_id = ?', "%#{search}%","#{campaign}"], :order => 'number'
end

end