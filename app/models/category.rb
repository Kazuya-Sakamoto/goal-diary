class Category < ApplicationRecord
    has_many :diary_categories
    has_many :diaries, through: :diary_categories
end
