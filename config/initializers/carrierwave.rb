require 'carrierwave/mongoid'
CarrierWave.configure do |config|
  config.storage                             = :gcloud
  config.gcloud_bucket                       = ENV['GOOGLE_ROOT_FOLDER']
  config.gcloud_bucket_is_public             = true
  config.gcloud_authenticated_url_expiration = 600
  config.gcloud_content_disposition          = 'attachment'

  config.gcloud_attributes = {
    expires: 600
  }

  File.open('/tmp/key.json',"w") { |f| f.write(ENV['GOOGLE_KEY_JSON']) }
  config.gcloud_credentials = {
      gcloud_project: ENV['GOOGLE_PROJECT_ID'],
      gcloud_keyfile: '/tmp/key.json'
  }
end