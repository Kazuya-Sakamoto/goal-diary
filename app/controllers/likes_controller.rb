class LikesController < ApplicationController
    before_action :logged_in_user

    def create
      @diaries = Diary.find(params[:diary_id])
      unless @diaries.iine?(current_user)
        @diaries.iine(current_user)
        respond_to do |for|
          for.html { redirect_to request.referrer || root_url }
          for.js
        end
      end
    end

    def destory
      @diaries = like.find(params[:id]).diary
      if @diaries.iine?(current_user)
        @diaries.iyada(current_user)
        respond_to do |for|
          for.html {redirect_to request.referrer || root_url }
          for.js
      end
    end
  end
end