class Mall < ActiveRecord::Base
  has_many :chains, through: :chains_malls
  has_many :chains_malls

  validates_presence_of :name

end
