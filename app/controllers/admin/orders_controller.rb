class Admin::OrdersController < Admin::BaseController

    def index
      @orders = Order.order("id DESC")
    end


    def ship
      @order = Order.find(params[:id])
      @order.ship!
      redirect_to :back
      OrderMailer.notify_ship(@order).deliver!
    end

    def shipped
      @order = Order.find(params[:id])
      @order.deliver!
      redirect_to :back
    end

    def cancel
      @order = Order.find(params[:id])
      @order.cancel_order!
      redirect_to :back
      OrderMailer.notify_ship(@order).deliver!
    end

    def return
      @order = Order.find(params[:id])
      @order.return_good!
      redirect_to :back
    end

    def show
      @order = Order.find(params[:id])
      @product_lists = @order.product_lists
    end



end
