class Book < ActiveRecord::Base

  belongs_to :author
  belongs_to :user
  belongs_to :subject


    def self.find_by_slug(slug)
      self.all.find do |book|
        book.slug == slug
      end
    end

    def slug
      unless name.nil?
        self.name.gsub(" ","-").downcase
      end
    end

end
