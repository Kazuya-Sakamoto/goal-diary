class Diary < ApplicationRecord
    # validates :title, :content, :image, presence: true
    mount_uploader :image, ImagesUploader

    belongs_to :user
 
    def date
      d1 = self.created_at
      d2 = self.goal
      date = (d2 - d1) / (3600 * 24)
      return date
    end
end
