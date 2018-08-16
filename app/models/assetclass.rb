class Assetclass < ApplicationRecord
	has_many :categories, dependent: :destroy
	has_many :products
end
