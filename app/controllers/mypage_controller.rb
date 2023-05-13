class MypageController < ApplicationController
  # GET /mypage
  def show
    @articles = current_user.articles
  end
end
