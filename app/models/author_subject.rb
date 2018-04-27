class AuthorSubect < ActiveRecord::Base

  belongs_to :author
  belongs_to :subject

end
