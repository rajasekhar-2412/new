class Custom < ActiveRecord::Base
  attr_accessor :name
  #validates :name, presence: true
  belongs_to :user
  belongs_to :bookmark
end
