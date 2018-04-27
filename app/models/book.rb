class Book < ActiveRecord::Base

  belongs_to :author
  belongs_to :user
  has_many :book_subjects
  has_many :subjects, through: :book_subjects

end
