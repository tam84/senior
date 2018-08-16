class Category < ApplicationRecord
	belongs_to :assetclass
	has_many :products
end
