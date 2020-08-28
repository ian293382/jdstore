class Admin::ProductsController < Admin::BaseController

  before_action :find_product, only: [:edit, :update, :destroy]

  def index
    # => 做order才能對商品排序調換 DSC or ASC (降/升) 前台也要排序
    @products = Product.page(params[:page] || 1).per_page(params[:per_page] || 10)
                .order("position ASC")
  end

  def new
   @product = Product.new
    @categories = Category.all.map { |c| [c.name, c.id] }
 end

 def create
   @product = Product.new(params.require(:product).permit!)
    @product.category_id = params[:category_id]

   if @product.save
     flash[:notice] = "創建成功"
     redirect_to admin_products_path
   else
     render action: :new
   end
 end

 def edit
   @categories = Category.all.map { |c| [c.name, c.id] }
   render action: :new
 end

 def update
   @product.attributes = params.require(:product).permit!
    @product.category_id = params[:category_id]
   if @product.save
     flash[:notice] = "修改成功"
     redirect_to admin_products_path
   else
     render action: :new
   end
 end

 def destroy
   @product = Product.find(params[:id])
   @product.destroy
   flash[:alert] = "你已經成功刪除"
   redirect_to admin_products_path
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




  private

    def find_product
     @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title, :description, :status, :quantity, :price, :category_id,  :msrp, :image, :uuid )
    end
end
