module PostsHelper

	def postable_photo postable_type, postable_id
    	
    	postable = postable_type.constantize.find_by(id: postable_id)
    	
    	if postable_type == "Firm" and postable.firm_photos.present?	
        	image_tag(postable.firm_photos.first.variant(resize: "50x50!"))
        elsif postable_type == "Product" and postable.firm.firm_photos.present?	
        	image_tag(postable.firm.firm_photos.first.variant(resize: "50x50!"))            
        elsif postable_type == "User" and postable.firm.firm_photos.present?	        	
        	image_tag(postable.profile_photos.first.variant(resize: "50x50!"))            
        else
            image_tag("https://www.lojasramos.com.br/App_Themes/lojasramos/images/not-found.jpg")        	
        end
	end


	def postable_name postable_type, postable_id
    	
    	postable = postable_type.constantize.find_by(id: postable_id)
    	
    	if postable_type == "Firm" || postable_type == "Product"
        	postable.name        
        elsif postable_type == "User" 
        	postable.full_name
        else
            ""
        end
	end



end
