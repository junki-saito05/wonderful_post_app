class MypageController < ApplicationController
  # GET /mypage
  def show
    articles = current_user.articles

    articles = articles.where("title LIKE ?", "%#{params[:title]}%") if params[:title].present?

    @articles = articles.page params[:page]
  end
end
