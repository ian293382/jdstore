class CreateProductImages < ActiveRecord::Migration[5.0]
  def change
    create_table :product_images do |t|
        t.belongs_to :product
        t.integer :weight, default: 0
        t.attachment :image
        #收藏
        t.string   :image
        t.boolean  :main_image, default: false

      t.timestamps
    end
  end
end
