class Image < ActiveRecord::Base
  mount_uploader :resource, ProductImageUploader

  belongs_to :imageable, polymorphic: true
end
