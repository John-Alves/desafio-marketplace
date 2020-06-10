class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  storage :file if Rails.env.test?

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
