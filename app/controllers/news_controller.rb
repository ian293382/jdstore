class NewsController < Admin::BaseController
  def index
    @newss = News.all
  end

  def show
    @news = New.find[params[:id]]
  end
end
