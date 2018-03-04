require 'carrierwave/orm/activerecord'
CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     'AKIAIPUSP74AHBTI6HAA',                        # required
      aws_secret_access_key: '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',                        # required
      region:                'ap-northeast-2',             # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'amateurstudio'            # required
end
