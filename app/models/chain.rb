class Chain < ActiveRecord::Base
  belongs_to :mall
end

class Mall < ActiveRecord::Base
  has_many :users
end