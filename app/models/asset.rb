class Asset < ActiveRecord::Base

  belongs_to :asset, polymorphic: true
  serialize :properties, Hash
end
