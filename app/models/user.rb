class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
        
  mount_uploader :image, ImagesUploader
        
  has_many :diaries
  has_many :goals
  has_many :comments
  has_many :likes
  # validates :introduction, length: { in: 1.1000}
end
