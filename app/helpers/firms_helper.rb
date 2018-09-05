module FirmsHelper


	def youtube_url
		User.last.job_title
	end


end
