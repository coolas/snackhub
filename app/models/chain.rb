class Chain < ActiveRecord::Base
  resourcify
  
  belongs_to :mall
  has_many :menus
end

# class Mall < ActiveRecord::Base
#   has_many :users
# end