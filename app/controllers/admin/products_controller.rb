class Admin::ProductsController < Admin::BaseController


  def index
    # => 做order才能對商品排序調換 DSC or ASC (降/升) 前台也要排序
    @products = Product.all.order("position ASC")
  end

  def new
    @product = Product.new
  end

  def edit
     @product = Product.find(params[:id])
   end

   def update
     @product = Product.find(params[:id])

     if @product.update(product_params)
       redirect_to admin_products_path
     else
       render :edit
     end
   end
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

      def move_up
        @product = Product.find(params[:id])

        @product.move_higher
        redirect_to :back

      end


      def move_down
        @product = Product.find(params[:id])
        @product.move_lower
        redirect_to :back
      end

      def destroy
        @product = Product.find(params[:id])
        @product.destroy
        flash[:alert] = "你已經成功刪除"
        redirect_to admin_products_path
      end


  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :image)
  end
end
