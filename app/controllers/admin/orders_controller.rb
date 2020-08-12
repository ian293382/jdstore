class Admin::OrdersController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!
  before_action :orders

    def index
      @order = Order.order("id DESC")
    end
end
