class Bookmark < ActiveRecord::Base

  belongs_to :user
  belongs_to :category
  has_one :custom
  validates :user_id,:category_id, presence: true
  validates :title, length: { minimum: 5 }, presence: true
  validates :url, format: {with: Regexp.new(URI::regexp(%w(http https)))}, presence: true

  paginates_per 3
end
