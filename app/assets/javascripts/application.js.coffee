#= require turbolinks
#= require jquery
#= require easing
#= require jquery.fancybox


$(document).on "page:change", ->
	$(document).ready()

$ ->
	$(".video a").click ->
		new_url = $(this).attr "data-youtube-url"
		$(".main-video").attr "src", "http://www.youtube.com/embed/#{new_url}"
		$(".main-video-title").html $(this).text()
		false

	$(".preview").fancybox
		type: 									"image"
		openEffect: 							"elastic"
		closeEffect: 							"elastic"
		
		openEasing: 							"easeOutElastic"
		openSpeed: 								400
		
		closeEasing: 							"easeOutQuad"
		closeSpeed: 							100
		
		helpers:
			overlay:
				css:
					'background': "rgba(77, 56, 97, 0)"

	if FB?
		FB.init { status: true, cookie: true, xfbml: true }

	else
		$.getScript "http://connect.facebook.net/en_US/all.js#xfbml=1", ->
			FB.init { status: true, cookie: true, xfbml: true }