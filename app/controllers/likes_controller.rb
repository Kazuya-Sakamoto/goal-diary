class LikesController < ApplicationController
    before_action :current_user

    def create
      Like.create(like_params)
      redirect_to root_path
      # @diaries = Diary.find(params[:diary_id])
      # unless @diaries.iine?(current_user)
      #   @diaries.iine(current_user)
      #   respond_to do |for|
      #     for.html { redirect_to request.referrer || root_url }
      #     for.js
      #   end
      # end
    end

    def destory
  #     @diaries = like.find(params[:id]).diary
  #     if @diaries.iine?(current_user)
  #       @diaries.iyada(current_user)
  #       respond_to do |for|
  #         for.html {redirect_to request.referrer || root_url }
  #         for.js
  #     end
  #   end
  # end
    end

    private
    def like_params
      params.permit().merge(user_id: current_user.id, diary_id: params[:diary_id])
    end
  end
