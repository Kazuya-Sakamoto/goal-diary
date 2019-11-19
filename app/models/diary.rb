class Diary < ApplicationRecord
    validates :goal, :content, :image, presence: true
    mount_uploader :image, ImagesUploader

    belongs_to :user
    has_many :comments
    has_many :likes
    validates :content, length: { in: 1..100 }

# self をメソッドに付与する事で、インスタンスメソッドではなく、クラスメソッドとして定義す
    def date
      d1 = self.created_at 
      d2 = self.goal
      date = (d2 - d1) / (3600 * 24)
      return date
    end
end
