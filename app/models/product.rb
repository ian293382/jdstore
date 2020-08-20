class Product < ApplicationRecord
  #掛上上傳圖片
  mount_uploader :image, ImageUploader
  #後台排序
  acts_as_list

  has_many :favorites
  has_many :member, through: :favorites, source: :user
end
