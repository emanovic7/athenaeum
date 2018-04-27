class User < ActiveRecord::Base

  has_secure_password

  has_many :books
  has_many :authors, through: :books


end
