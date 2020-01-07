class Diary < ApplicationRecord
    validates :goal, :content, presence: true
    validates :content, length: { in: 1..1000 }, presence: true
    mount_uploader :image, ImagesUploader
    belongs_to :user
    has_many :comments
    has_many :likes
    has_many :liked_users, through: :likes, source: :user
    has_many :diary_categories
    has_many :categories, through: :diary_categories

# self をメソッドに付与する事で、インスタンスメソッドではなく、クラスメソッドとして定義する
    def date
      d1 = self.created_at 
      d2 = self.goal
      date = (d2 - d1) / (3600 * 24)
    end

    def dates(goal)
      dates = goal.to_date - Date.today
    end

    def self.search(search)
      if search
        Diary.where('content LIKE(?)', "%#{search}%")
      else
        Diary.all
      end
    end
end
