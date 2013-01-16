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

	def criado_ha_quantos_dias?(artigo)
		(Time.now - artigo.created_at).divmod(60*60*24)[0]
	end

	def postado_quando?(artigo, verbo="postado")
		if criado_ha_quantos_dias?(artigo) < 7
			output = "#{verbo} <strong>#{l(artigo.created_at, format: '%A')}</strong>"
		else 
			output = "#{verbo} há <strong>#{ criado_ha_quantos_dias? artigo}</strong> dias atrás"
		end
		output.html_safe
	end

	def a_que_horas?(artigo)
		horas_24 = l artigo.created_at, format: '%k'
		horas_12 = l artigo.created_at, format: '%l'

		case horas_24.to_i
		when 0 then output = "à <strong>meia-noite</strong>"
		when 12 then output = "ao <strong>meio-dia</strong>"
		else
			periodo = case horas_24
				when 4..11 then "da manhã"
				when 13..18 then "da tarde"
				when 19..23 then "da noite"
				when 0..3 then "da madrugada, (insônia é foda)"
				else ""
			end

			output = "às <strong>#{ horas_24 } #{periodo}</strong>"

		end
		output.html_safe
	end
end
