class Diary < ApplicationRecord
    # validates :title, :content, :image, presence: true
    # belongs_to :user
    mount_uploader :image, ImagesUploader
end
