class Chain < ActiveRecord::Base
  resourcify
  attr_accessor :chain_logo

  
  belongs_to :mall
  has_many :menus
  mount_uploader :chain_logo, ItemCoverPhotoUploader


  # REPORTS
  def daily_sales(selected_date)
 	#selected_date = Date.parse('12-03-2017') # change
 	selected_date = Date.parse(selected_date)
 	Order.where("DATE(created_at) = ? AND chain_id = ?", selected_date, self.id).pluck(:created_at, :total)
  end

  def daily_total(selected_date)
  	selected_date = Date.parse(selected_date)
  	Order.where("DATE(created_at) = ? AND chain_id = ?", selected_date, self.id).sum(:total)
  end

  def weekly_sales(selected_date)
  	selected_date = Date.parse(selected_date)
  	Order.where(created_at: (selected_date.at_beginning_of_week..selected_date.at_end_of_week), chain_id: self.id).pluck(:created_at, :total)
  end

  def weekly_total(selected_date)
  	selected_date = Date.parse(selected_date)
  	Order.where(created_at: (selected_date.at_beginning_of_week..selected_date.at_end_of_week), chain_id: self.id).sum(:total)
  end

  def monthly_sales(selected_date)
  	selected_date = Date.parse(selected_date)
  	Order.where(created_at: (selected_date.at_beginning_of_month..selected_date.at_end_of_month), chain_id: self.id).pluck(:created_at, :total)
  end

  def monthly_total(selected_date)
  	selected_date = Date.parse(selected_date)
  	Order.where(created_at: (selected_date.at_beginning_of_month..selected_date.at_end_of_month), chain_id: self.id).sum(:total)
  end

end

# class Mall < ActiveRecord::Base
#   has_many :users
# end