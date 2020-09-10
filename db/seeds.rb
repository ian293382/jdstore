# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.new
u.email = "123@qwe.com"           # 可以改成自己的 email
u.name = "Ian Lee"
u.password = "123qwe"                # 最少要六码

u.password_confirmation = "123qwe"   # 最少要六码

u.is_admin = true
u.save



# 新增類型  Category #
   CategoryGroup.create!(
     name: '日常文具'
   )

   CategoryGroup.create!(
     name: '生活器物'
   )

   CategoryGroup.create!(
     name: '個人單品'
   )

   puts '創建類型*3：日常文具、生活器物、個人單品'

 # 新增分類  Category #
   # 文具
   # 1
   Category.create!(
     category_group_id: 1,
     name: '筆具'
   )

   # 2
   Category.create!(
     category_group_id: 1,
     name: '筆袋'
   )

   # 3
   Category.create!(
     category_group_id: 1,
     name: '紙本'
   )

   # 4
   Category.create!(
     category_group_id: 1,
     name: '刀剪'
   )

   # 5
   Category.create!(
     category_group_id: 1,
     name: '尺規'
   )

   puts '創建「日常文具」分類*5：筆具、筆袋、紙本、刀剪、書籤'

   # 生活
   # 6
   Category.create!(
     category_group_id: 2,
     name: '收納'
   )

   # 7
   Category.create!(
     category_group_id: 2,
     name: '裝飾'
   )

   # 8
   Category.create!(
     category_group_id: 2,
     name: '器皿'
   )

   puts '創建「生活器物」分類*3：收納、裝飾、器皿'

   # 個人
   # 9
   Category.create!(
     category_group_id: 3,
     name: '提袋'
   )
   # 10
   Category.create!(
     category_group_id: 3,
     name: '皮件'
   )
   # 11
   Category.create!(
     category_group_id: 3,
     name: '小物'
   )

   puts '創建「個人單品」分類*3：提袋、皮件、小物'
