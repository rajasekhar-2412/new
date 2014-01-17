class Category < ActiveRecord::Base
  has_many :bookmarks
  validates :name, :presence => true, :uniqueness => true
end
