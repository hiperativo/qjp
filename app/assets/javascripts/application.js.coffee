#= require jquery
#= require easing
#= require jquery.fancybox

# $(document).on "page:change", ->
# 	FB.XFBML.parse()
# 	do video_interactions
# 	do fancybox_configuration

$ ->
	FB.init 
		appId: '267159516719712'
		xfbml: true

	# $.ajax
	# 	url: 
	# 	dataType: 'script'
	# 	cache: true


	video_interactions = ->
		$(".video a").click ->
			new_url = $(this).attr "data-youtube-url"
			$(".main-video").attr "src", "http://www.youtube.com/embed/#{new_url}"
			$(".main-video-title").html $(this).text()
			false

	fancybox_configuration = ->
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