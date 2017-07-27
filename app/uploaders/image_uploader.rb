class ImageUploader < CarrierWave::Uploader::Base
  process :store_dimensions


  version :show do
    process :resize_to_limit => [500, 500]
    process :store_dimensions
  end

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  private

    def store_dimensions
      if file && model
        model.width, model.height = `identify -format "%wx%h" #{file.path}`.split(/x/)
      end
    end

end
