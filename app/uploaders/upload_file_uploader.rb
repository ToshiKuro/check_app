class UploadFileUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  include Cloudinary::CarrierWave

  process :convert => 'pdf' # 画像の保存形式
  process :tags => ['image'] # 保存時に添付されるタグ（管理しやすいように適宜変更しましょう）
  process :resize_to_limit => [700, 700] # 任意でリサイズの制限
  cloudinary_transformation :use_filename => true

  # 保存する画像の種類をサイズ別に設定
  # version :standard do
  #   process :resize_to_fill => [100, 150, :north]
  # end

  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  def public_id
    Cloudinary::PreloadedFile.split_format(original_filename).first + "_" + Cloudinary::Utils.random_public_id[0,6]
  end

  def extension_whitelist
    %w(pdf png jpg)
  end

  # Choose what kind of storage to use for this uploader:
  # storage :file                                             #cloudinary installに伴いコメントアウト
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
