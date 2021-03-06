class Book < ActiveRecord::Base

  belongs_to :author
  belongs_to :user
  has_many :book_subjects
  has_many :subjects, through: :book_subjects


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

    def self.valid_params?(params)
      return !params[:name].empty?
    end

end
