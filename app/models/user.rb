class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  include DeviseTokenAuth::Concerns::User
  
  belongs_to :chain
  has_many :orders

  after_create :set_role, :send_confirmation_instructions


  attr_accessor :is_chain, :role_id

  def set_role
    if self.role_id == '2'
      self.add_role :admin
    end
  end


  def daily_sales_sa(selected_date, chain_id)
  #selected_date = Date.parse('‎12-03-2017') # change
  selected_date = Date.parse(selected_date)
  Order.where("DATE(created_at) = ? AND chain_id = ?", selected_date, chain_id).pluck(:created_at, :total)
  end

  def daily_total_sa(selected_date, chain_id)
    selected_date = Date.parse(selected_date)
    Order.where("DATE(created_at) = ? AND chain_id = ?", selected_date, chain_id).sum(:total)
  end

  def weekly_sales_sa(selected_date, chain_id)
    selected_date = Date.parse(selected_date)
    Order.where(created_at: (selected_date.at_beginning_of_week..selected_date.at_end_of_week), chain_id: chain_id).pluck(:created_at, :total)
  end

  def weekly_total_sa(selected_date, chain_id)
    selected_date = Date.parse(selected_date)
    Order.where(created_at: (selected_date.at_beginning_of_week..selected_date.at_end_of_week), chain_id: chain_id).sum(:total)
  end

  def monthly_sales_sa(selected_date, chain_id)
    selected_date = Date.parse(selected_date)
    Order.where(created_at: (selected_date.at_beginning_of_month..selected_date.at_end_of_month), chain_id: chain_id).pluck(:created_at, :total)
  end

  def monthly_total_sa(selected_date, chain_id)
    selected_date = Date.parse(selected_date)
    Order.where(created_at: (selected_date.at_beginning_of_month..selected_date.at_end_of_month), chain_id: chain_id).sum(:total)
  end
end