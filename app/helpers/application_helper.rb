# encoding: utf-8
module ApplicationHelper
	def youtube_video(url)
		haml_tag 	:iframe, :allowfullscreen => "", 
					:frameborder => "0",
					:src => "http://www.youtube.com/embed/#{@videos.first.url}",
					:class => "main-video",
					:width => 600,
					:height => 350
	end

	def youtube_thumb(url)
		image_tag "//i3.ytimg.com/vi/#{url}/default.jpg", :width => "120"
	end

	def m(string)
		Maruku.new(string).to_html.html_safe
	end

	def gravatar(email, size)
		"http://www.gravatar.com/avatar/#{ Digest::MD5.hexdigest(email) }?s=#{ size }"
	end

	def gravatar_image(email, size)
		image_tag (gravatar email, size), class: "img-circle"
	end
end