class User < ActiveRecord::Base
  has_many :medicines
  has_one :calendar
  has_secure_password

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
end
