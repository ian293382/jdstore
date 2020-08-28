class CreateCategoryGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :category_groups do |t|
      t.string :name
      t.boolean :is_hidden, default: false
      t.string :image
      t.string :logo
      t.string :description
      t.timestamps
    end
    add_index :category_groups, [:neme]
  end
end
