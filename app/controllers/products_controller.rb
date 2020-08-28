class ProductsController < ApplicationController

  def index
    # 商品類型
    @category_groups = CategoryGroup.published

    # 判斷是否篩選分類
  if params[:category].present?
       @category_s = params[:category]
       @category = Category.find_by(name: @category_s)

       @products = Product.where(:category => @category.id).published.recent.paginate(:page => params[:page], :per_page => 10)
                    .order("position ASC")


                    # 判斷是否篩選類型
    elsif params[:group].present?
      @group_s = params[:group]
      @group = CategoryGroup.find_by(name: @group_s)

      @products = Product.joins(:category).where("categories.category_group_id" => @group.id).published.recent.paginate(:page => params[:page], :per_page => 12)
 # 預設顯示所有公開商品
    else
          @products = Product.onshelf.paginate(:page => params[:page], :per_page => 12).order("position ASC")
        end
  end

  def show

    @product = Product.find(params[:id])

    @category_groups = CategoryGroup.published
    set_page_title       @product.title
    set_page_description @product.description
    set_page_keywords    @product.title
    set_page_image       @product_images.first.image.main.url

  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
       current_cart.add_product_to_cart(@product)
       flash[:notice] = "你已成功將 #{@product.title} 加入購物車"
    else
        flash[:warning] = "你的購物車内已有此物品"
    end
     redirect_to :back
  end
  def add_to_favorite
    @product = Product.find(params[:id])
    if !current_user.is_member_of?(@product)
      current_user.add_favorite!(@product)
    end
      redirect_to :back
    end

    def remove_to_favorite
      @product = Product.find(params[:id])
      if current_user.is_member_of?(@product)
        current_user.remove_favorite!(@product)
      end
        redirect_to :back
    end

end
