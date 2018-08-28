module ApplicationHelper
  def gravatar_for(user, opts = {})
    opts[:alt] = user.name
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}?s=#{opts.delete(:size) { 40 }}",
              opts
  end


  def path_helper url
  	if url[:id]
  		Rails.application.routes.recognize_path(request.url)[:id]
  	else
  		Rails.application.routes.recognize_path(request.url)[:controller]
  	end
  end

end
