class Owner::NewsController < ApplicationController
  before_action :authenticate_user!
  def index
    @newss = News.all
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

  def edit
    @news = News.find(params[:id])
  end

  def create
    @news = News.new(news_params)
    if @news.save
      redirect_to owner_newss_path
    else
      render :new
    end
  end

  def update
    @news = News.find(params[:id])

    if @news = News.update(news_params)
      redirect_to owner_newss_path
    else
      render :new
    end
  end

  def destroy
    @news = News.find(params[:id])

    @news.destroy

    redirect_to owner_newss_path

  end


  private

  def news_params
    params.require(:news).permit(:title, :description)

  end

end
