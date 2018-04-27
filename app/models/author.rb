class Author < ActiveRecord::Base

  has_many :books
  has_many :users, through: :books
  has_many :subjects, through: :books



  def self.find_by_slug(slug)
    self.all.find do |author|
      author.slug == slug
    end
  end

  def slug
    unless name.nil?
      self.name.gsub(" ","-").downcase
    end
  end


end
