class Chain < ActiveRecord::Base
  belongs_to :mall
  has_many :menus
end

class Mall < ActiveRecord::Base
  has_many :users
end