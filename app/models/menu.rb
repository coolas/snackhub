class Menu < ActiveRecord::Base
	resourcify
	
	has_many :items
	belongs_to :chain
end
