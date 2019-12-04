class Diary < ApplicationRecord
    validates :goal, :content, presence: true
    validates :content, length: { in: 1..1000 }, presence: true
    mount_uploader :image, ImagesUploader
    belongs_to :user
    has_many :comments
    has_many :likes

# self をメソッドに付与する事で、インスタンスメソッドではなく、クラスメソッドとして定義す
    def date
      d1 = self.created_at 
      d2 = self.goal
      date = (d2 - d1) / (3600 * 24)
    end

    def dates(goal)
      dates = goal.to_date - Date.today
    end
end
