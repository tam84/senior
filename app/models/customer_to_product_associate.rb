class CustomerToProductAssociate < ApplicationRecord
	belongs_to :user
	belongs_to :product_associate
end


