class Category < ActiveRecord::Base
  has_many :products
  has_one :header_image, -> { where photo_type: "HeaderImage" },
    as: :imageable,
    class_name: "Image"
  has_one :category_image, -> { where photo_type: "CategoryImage" },
    as: :imageable,
    class_name: "Image"
end
