class User < ActiveRecord::Base

  validates :name, presence: true
  validates :email, presence: true

  has_secure_password

  has_many :books
  has_many :authors, through: :books
  has_many :subjects, through: :books

#find user by id, not slug
=begin
    def self.find_by_slug(slug)
      self.all.find do |user|
        user.slug == slug
      end
    end

    def slug
      unless user_name.nil?
        self.user_name.gsub(" ","-").downcase
      end
    end
=end

end
