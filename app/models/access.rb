class Access < ActiveRecord::Base
	belongs_to :right
	belongs_to :role
end
