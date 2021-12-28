class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, :user_type, presence: true

  has_one :admin
  has_one :buyer
    
  def admin?
    has_role?(:admin)
  end

  def buyer?
    has_role?(:buyer)
  end

end
