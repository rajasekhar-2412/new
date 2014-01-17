class Train < ActiveRecord::Base
  
  validates :name, presence: true, uniqueness: true
  validates :number, presence: true
  validates :from, presence: true
  validates :to, presence: true
end
