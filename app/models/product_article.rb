class ProductArticle < ApplicationRecord
	belongs_to :category
	belongs_to :assetclass
	has_many_attached :images
	belongs_to :assetclass


end
