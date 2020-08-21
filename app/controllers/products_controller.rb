class ProductsController < ApplicationController

  def index
    @products = Product.all.order("position ASC")
  end

  def show
    @product = Product.find(params[:id])
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
