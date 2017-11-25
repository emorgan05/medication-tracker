class User < ActiveRecord::Base
  has_many :medicines
  has_one :calendar
  has_secure_password

  validates :username, :email, :password, presence: true
end
