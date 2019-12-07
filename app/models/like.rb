class Like < ApplicationRecord
    belongs_to :diary
    belongs_to :user
    validates :user_id, presence: true
    validates :diary_id, presence: true
end
