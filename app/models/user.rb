class User < ActiveRecord::Base

  has_secure_password

  has_many :books
  has_many :authors, through: :books


    def self.find_by_slug(slug)
      self.all.find do |user|
        user.slug == slug
      end
    end

    def slug
      unless name.nil?
        self.name.gsub(" ","-").downcase
      end
    end

end
