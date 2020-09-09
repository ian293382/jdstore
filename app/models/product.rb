class Product < ApplicationRecord
  #掛上上傳圖片
  mount_uploader :image, ImageUploader
  #後台排序
  acts_as_list


#檔案配置
# 新增/修改欄位限制與提示 #
validates :name, presence: { message: "請輸入商品名稱" }
validates :price, presence: { message: "請輸入商品售價" }
validates :price, numericality: { greater_than: 0, message: "請輸入商品售價，必須大於零" }
validates :quantity, presence: { message: "請入庫存數量" }, numericality: { greater_than_or_equal: 0 }
validates :category_id, presence: { message: "請選擇商品分類" }


# 關聯 #分類
belongs_to :category

#image
has_many :product_images, dependent: :destroy
 accepts_nested_attributes_for :product_images
#收藏
  has_many :favorites
  has_many :member, through: :favorites, source: :user


  # 精選商品(放圖) #
  def chosen!
    self.is_chosen = true
    self.save
  end

  def no_chosen!
    self.is_chosen = false
    self.save
  end



        # 商品資訊網址優化 #
        def to_param
          "#{self.id}-#{self.name.gsub(/\s+/, "")}"
        end

        # 發佈 / 隱藏 #
        def publish!
          self.is_hidden = false
          self.save
        end

          def hide!
            self.is_hidden = true
            self.save
          end



          # 檢查 is_hidden 的 boolean 值 #
          def hidden?
            is_hidden
          end

# Scope #
scope :published, -> { where(is_hidden: false) }
scope :recent, -> { order('created_at DESC') }
scope :random3, -> { limit(3).order('RANDOM()') }

end
