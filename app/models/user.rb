class User < ActiveRecord::Base
  has_many :medicines
  has_secure_password

end
