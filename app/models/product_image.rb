class ProductImage < ApplicationRecord
  belongs_to :product
  #指定圖片大小

  has_attached_file :image, stytle: {
    small: '60^x60',
    middle: '240^x240',
    big: '960x'
  }

  #限制上傳類型
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  #限制上傳圖片大小
  validates_attachment_size :image, in: 0..10.megabytes
end
