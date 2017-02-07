class Mall < ActiveRecord::Base
  has_many :chains
  belongs_to :location
 validates_presence_of :name
end
	