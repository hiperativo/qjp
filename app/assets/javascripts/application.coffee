$ ->
	$(".video a").click ->
		new_url = $(this).attr "data-youtube-url"
		$(".main-video").attr "src", "http://www.youtube.com/embed/#{new_url}"
		false
