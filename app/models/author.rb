class Author < ActiveRecord::Base

  has_many :books
  has_many :users, through: :books
  has_many :subjects, through: :books


end
