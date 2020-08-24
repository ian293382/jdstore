class Product < ApplicationRecord
  #掛上上傳圖片
  mount_uploader :image, ImageUploader
  #後台排序
  acts_as_list


#檔案配置
validates :category_id, presence: { message: "category cannot be empty"}
validates :title, presence: { message: "title cannot be empty"}
validates :status, inclusion: { in: %w[on off], message: "status should be (on or off)" }
validates :quantity, numericality: { only_integer: true, message: "quantity should be integer"},
  if: proc { |product| !product.quantity.blank? }

validates :msrp, numericality: { message: "MSRP Must be numericality" },
  if: proc { |product| !product.msrp.blank? }








   #加入分類
   belongs_to :category
#收藏
  has_many :favorites
  has_many :member, through: :favorites, source: :user
#Product_image
  has_many :product_images, -> { order(weight: 'desc') }, dependent: :destroy

  before_create :set_default_attrs #產品生產之前建造單一序號


#status
  module Status
   On = 'on'
   Off = 'off'
  end

  private

   def set_default_attrs
     self.uuid = RandomCode.generate_product_uuid
   end


end
