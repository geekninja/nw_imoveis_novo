class ImageUploader < CarrierWave::Uploader::Base
  
  storage :fog  if Rails.env.production?
  storage :file if Rails.env.development?

  def store_dir
    'uploads'
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    if original_filename
      @name ||= Digest::MD5.hexdigest(File.dirname(current_path))
      "#{@name}.#{file.extension}"
    end
  end
end