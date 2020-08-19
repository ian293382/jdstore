class NewsController < ApplicationController
  def index
    @newss = News.all
  end

  def show
    @news = New.find[params[:id]]
  end
end
