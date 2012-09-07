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
end
