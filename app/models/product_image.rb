class ProductImage < ApplicationRecord
  belongs_to :product
  #指定圖片大小

  has_attached_file :image, styles: {
  
      small: '60^x60',
      middle: '200^x200',
      big: "960x"
    }

  #限制上傳類型
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  #限制上傳圖片大小
  validates_attachment_size :image, in: 0..10.megabytes
end
