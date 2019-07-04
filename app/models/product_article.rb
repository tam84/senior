class ProductArticle < ApplicationRecord
	belongs_to :category
	belongs_to :assetclass
	has_many_attached :images
	belongs_to :assetclass


	def to_param
    	[id, title.parameterize].join("-")
  	end 


end
 