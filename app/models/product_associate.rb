class ProductAssociate < ApplicationRecord
	belongs_to :product
	belongs_to :user

	has_many :customer_to_product_associates
end
