class Comment < ApplicationRecord
    has_many :diary
    belongs_to :user
end
