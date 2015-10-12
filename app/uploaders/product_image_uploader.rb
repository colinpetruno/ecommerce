class ProductImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :thumbnail do
    process resize_to_fill: [164, 164, :center]
    process convert: 'jpg'
    cloudinary_transformation :quality => 80
  end

  version :gallery do
    process resize_to_fill: [700, 500, :center]
    process convert: 'jpg'
    cloudinary_transformation :quality => 80
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
