class Product < ApplicationRecord
  #掛上上傳圖片
  mount_uploader :image, ImageUploader
  #後台排序
  acts_as_list


  has_many :favorites
  has_many :member, through: :favorites, source: :user

  before_create :set_default_attrs #產品生產之前建造單一序號

  private

   def set_default_attrs
     self.uuid = RandomCode.generate_product_uuid
   end


end
