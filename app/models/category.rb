class Category < ApplicationRecord
	belongs_to :assetclass
	has_many :products
	has_many :product_articles
end
