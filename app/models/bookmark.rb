class Bookmark < ActiveRecord::Base

  belongs_to :user
  belongs_to :category
  has_one :custom
  validates :user_id,:category_id, presence: true
  validates :title, length: { minimum: 5 }, presence: true
  validates :url, format: {with: Regexp.new(URI::regexp(%w(http https)))}, presence: true

  paginates_per 5



  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names[1,2].map(&:upcase)
      all.each do |bookmark|
        csv << bookmark.attributes.values_at(*column_names[1,2])
      end
    end
  end


end
