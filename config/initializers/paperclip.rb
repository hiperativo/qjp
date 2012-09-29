Paperclip::Attachment.default_options.update({
	path: "images/:class/:id/:attachment/:style/img_:fingerprint",
	storage: :fog,
	url: 'qjp.storage.googleapis.com', #example: assets.blah.com

	fog_credentials: {
		provider: 							'Google',
		google_storage_access_key_id: 		ENV['CLOUD_ID'], #example: GOOGNSFE234C4f
		google_storage_secret_access_key: 	ENV['CLOUD_PASS'], #example: AERG4234D43DFg4234DVDF5423sDCSDC
	},

	fog_public: 	true, #this must be set to true or ALL assets will be private by DEFAULT
	fog_host: 		'http://commondatastorage.googleapis.com/qjp', #example: http://assets.blah.com.commondatastorage.googleapis.com This can be changed to CDN
	fog_directory: 	'qjp', #example: assets.blah.com
})