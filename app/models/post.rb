class Post < ApplicationRecord
	belongs_to :postable, polymorphic: true

	validates :content, presence: true
	
end
