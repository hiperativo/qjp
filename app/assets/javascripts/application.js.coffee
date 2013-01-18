#= require jquery
#= require easing
#= require jquery.fancybox

# $(document).on "page:change", ->
# 	FB.XFBML.parse()
# 	do video_interactions
# 	do fancybox_configuration

$ ->
	$.ajax
		url: "//connect.facebook.net/en_US/all.js"
		dataType: 'script'
		cache: true
		
		success: ->
			FB.init 
				appId: '267159516719712'
				xfbml: true

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