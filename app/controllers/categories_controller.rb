class CategoriesController < ApplicationController



  def show

    fetch_home_data  #重構 ApplicationController >>base_controller
    @category = Category.find(params[:id])
    @products = @category.products.onshelf.page(params[:page] || 1).per_page(params[:per_page] || 12)
      .order("id desc").includes(:main_product_image)
  end






end
