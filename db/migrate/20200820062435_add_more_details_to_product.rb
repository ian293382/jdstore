class AddMoreDetailsToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :category_id, :integer
    add_column :products, :status, :string, default: 'off'
    #商品上架下架,設置為string模式 方便後續增加數量

    add_column :products, :uuid, :string
    #uuid為商品序列號

    add_column :products, :msrp, :decimal, precision: 10, scale: 2
    #msrp當市場建議零售價縮寫用於打折

    #建立玩一張表時在家索引建立好`,用於搜索
    add_index :products, [:status, :category_id]
    add_index :products, [:category_id]
    add_index :products, [:uuid], unique: true  #單一性


    add_index :products, [:title]
  end
end
