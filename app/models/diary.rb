class Diary < ApplicationRecord
    # validates :title, :content, :image, presence: true
    mount_uploader :image, ImagesUploader

    belongs_to :user
end
