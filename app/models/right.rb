class Right < ActiveRecord::Base
	has_many :accesses
	has_many :roles, :through => :accesses
end
