class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
        
  # validates :introduction, presence: true
        
  mount_uploader :image, ImagesUploader
        
  has_many :diaries
  has_many :goals
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_diaries, through: :likes, source: :post
  # validates :introduction, length: { in: 1.1000}
  def already_liked?(diary)
    self.likes.exists?(diary_id: diary.id)
  end
end
