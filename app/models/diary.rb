class Diary < ApplicationRecord
    validates :goal, :content, :image, presence: true
    mount_uploader :image, ImagesUploader

    belongs_to :user
    has_many :comments
    has_many :likes
    validates :content, length: { in: 1..1000 }

    def date
      d1 = self.created_at
      d2 = self.goal
      date = (d2 - d1) / (3600 * 24)
      return date
    end
    # # いいね追加
    # def iine(user)
    #   likes.create(user_id: user_id)
    # end
    # # いいね削除
    # def iyada(user)
    #   likes.find_by(user_id: user_id).destroy
    # end
end
