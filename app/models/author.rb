class Author < ActiveRecord::Base

  validates :name, presence: true
  
  has_many :books
  has_many :users, through: :books
  has_many :subjects, through: :author_subjects



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

  def self.valid_params?(params)
    return !params[:name].empty?
  end

end
