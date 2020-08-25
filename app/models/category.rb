class Category < ApplicationRecord

  before_validation :correct_ancestry
  validates :title, presence: { message: "名稱不能為空格"}
  validates :title, uniqueness: { message: "名稱不能重複"}

  has_ancestry orphan_strategy: :destroy


  has_ancestry
   has_many :products, dependent: :destroy


#保證在多個頁面取得分類 def category

  def self.grouped_data
    self.roots.order("weight desc").inject([]) do |result,  parent|
      row = []
      row << parent
      row << parent.children.order("weight desc")
      result << row
    end
  end



  private

  def correct_ancestry
    self.ancestry = nil if self.ancestry.blank?
  end

end
