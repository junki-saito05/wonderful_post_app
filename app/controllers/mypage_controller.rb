class MypageController < ApplicationController
  # GET /mypage
  def show
    #@articles = current_user.articles
    @articles = current_user.articles.page params[:page]
  end
end
