class CasasDeRepouso < ApplicationRecord


	has_many_attached :images


	def to_param
    	[id, name.parameterize].join("-")
  	end 

end
