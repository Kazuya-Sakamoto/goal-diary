class Image < ApplicationRecord
  belongs_to :diary
  mount_uploader :image, ImagesUploader
end
