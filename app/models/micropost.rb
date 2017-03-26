class Micropost < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :user_id, presence:true
  validates :content, presence:true, length: { maximum: 140 }
  
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
