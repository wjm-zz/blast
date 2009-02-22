class Campaign < ActiveRecord::Base
	belongs_to :site
	has_many :numbers,:dependent => :destroy
end
