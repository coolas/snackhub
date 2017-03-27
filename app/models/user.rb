class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  include DeviseTokenAuth::Concerns::User
  
  belongs_to :chain
  has_many :orders

  after_create :send_confirmation_instructions

  attr_accessor :is_chain

  def set_role
    if self.role_id == 2
      self.add_role :admin
    end
  end
end
