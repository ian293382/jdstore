class Owner::NewsController < ApplicationController
  before_action :authenticate_user!

  layout 'admin'
  def index
    @newses = News.all
  end

  def new
    @news = News.new
  end

  def edit
    @news = News.find(params[:id])
  end

  def show
    @news = News.find(params[:id])
  end


    #當 news.all and news.new 衝突改動方式  owner_news_index_path
  def create
    @news = News.new(news_params)
    if @news.save
      redirect_to owner_news_index_path
    else
      render :new
    end
  end

  def update
    @news = News.find(params[:id])

    if @news = News.update(news_params)
      redirect_to owner_news_index_path
    else
      render :new
    end
  end

  def destroy
    @news = News.find(params[:id])

    @news.destroy

    redirect_to owner_news_index_path

  end


  private

  def news_params
    params.require(:news).permit(:title, :description)

  end

end
