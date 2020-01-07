class DiaryCategory < ApplicationRecord
    belongs_to :diary
    belongs_to :category
end
