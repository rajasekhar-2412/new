class Library < ActiveRecord::Base

  has_many :assets, as: :asset, dependent: :destroy
end
