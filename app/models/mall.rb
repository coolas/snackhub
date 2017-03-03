class Mall < ActiveRecord::Base
  resourcify
  
  has_many :chains
  belongs_to :location
  validates_presence_of :name
end
	