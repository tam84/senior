class YoutubeVideo < ApplicationRecord
	belongs_to :videoable, polymorphic: true

end
