class Laboratory < ActiveRecord::Base

  has_many :assets, as: :asset

end
