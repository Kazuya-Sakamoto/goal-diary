class Like < ApplicationRecord
    belongs_to :user
    belongs_to :diary
    counter_culture :diary
    validates :user_id, presence: true
    validates :diary_id, presence: true
end
