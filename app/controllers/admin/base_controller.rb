class Admin::BaseController < ApplicationController
   layout 'layouts/adminweb'
  before_action :authenticate_user!
  before_action :admin_required
  before_action :fetch_home_data #重構 分類資料庫查詢量


  def admoin_required
    if !current_user.admin?
      redirect_to "/", alert: "You are not admin"
    end
  end


  def fetch_home_data
      @categories = Category.grouped_data
  end

end
