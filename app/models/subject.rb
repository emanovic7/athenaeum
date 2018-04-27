class Subject < ActiveRecord::Base

  has_many :book_subjects
  has_many :books, through: :book_subjects
  has_many :authors, through: :books


    def self.find_by_slug(slug)
      self.all.find do |subject|
        subject.slug == slug
      end
    end

    def slug
      unless name.nil?
        self.name.gsub(" ","-").downcase
      end
    end

end
