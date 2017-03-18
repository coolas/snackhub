CarrierWave.configure do |config|
		config.fog_provider = 'fog/aws'
		config.fog_credentials = {
			provider: "AWS",
			aws_access_key_id: "AKIAJD4XIMED4YETVDQQ",
			aws_secret_access_key: "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",
		}
		config.fog_directory = "snackhub"

end