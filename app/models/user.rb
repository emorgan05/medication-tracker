class User < ActiveRecord::Base
  has_many :medicines
  has_one :calendar
  has_secure_password

end
