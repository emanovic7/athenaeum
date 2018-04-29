class Subject < ActiveRecord::Base

  has_many :books
  has_many :author_subjects
  has_many :authors, through: :author_subjects


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
