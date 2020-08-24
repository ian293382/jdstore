class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|

        t.string :title
        t.integer :weight, default: 0 #權重比例


        t.integer :products_counter, default: 0 #在分類下產品數量 0,1,2...


      t.timestamps
    end
    add_index :categories, [:title]
    #建立一張表,能讓搜索功能用到
  end
end
