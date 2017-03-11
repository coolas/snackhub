class Chain < ActiveRecord::Base
  resourcify
  attr_accessor :chain_logo

  
  belongs_to :mall
  has_many :menus
  mount_uploader :chain_logo, ItemCoverPhotoUploader
end

# class Mall < ActiveRecord::Base
#   has_many :users
# end