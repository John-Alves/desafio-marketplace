require 'carrierwave/mongoid'

CarrierWave.configure do |config|
  if Rails.env.test?
    config.storage = :file
    config.enable_processing = false
  else
    config.storage                             = :gcloud
    config.gcloud_bucket                       = ENV['GOOGLE_ROOT_FOLDER']
    config.gcloud_bucket_is_public             = true
    config.gcloud_authenticated_url_expiration = 600
    config.gcloud_content_disposition          = 'attachment'

    config.gcloud_attributes = {
        expires: 600
    }

    config.gcloud_credentials = {
        gcloud_project: ENV['GOOGLE_PROJECT_ID'],
        gcloud_keyfile: ENV['GOOGLE_KEY_JSON']
    }
  end
end