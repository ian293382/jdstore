class Product < ApplicationRecord
  #掛上上傳圖片
  mount_uploader :image, ImageUploader
end
