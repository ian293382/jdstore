class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         def admin?
           is_admin
         end

  #訂單與使用者有關連
  has_many :orders

  #favorite

  has_many :favorites
  has_many :favorite_products, through: :favorites, source: :product

  # 判別是否收藏
  def is_member_of?(product)
    favorite_products.include?(product)
  end

  def add_favorite!(product)
    favorite_products << product
  end

  def remove_favorite!(product)
    favorite_products.delete(product)
  end

end
