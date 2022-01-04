class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, :user_type, presence: true

  has_one :account
  
  after_create :set_role, :create_account
    
  def admin?
    has_role?(:admin)
  end

  def buyer?
    has_role?(:buyer)
  end

  def create_account
    if self.user_type == 'Admin'
      Account.create(user: self, first_name: 'Sample', last_name: 'Account', verified: true)
    elsif self.user_type == 'Buyer'
      Account.create(user: self, first_name: 'Sample', last_name: 'Account')
    end
  end

  def set_role
    if self.user_type == 'Admin'
      self.add_role(:admin)
    elsif self.user_type == 'Buyer'
      self.add_role(:buyer)
    end
  end

end
