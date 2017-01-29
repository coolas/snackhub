class Chain < ActiveRecord::Base
  has_many: users

  has_many :malls, through: :chains_malls
  has_many :chains_malls
  
end
