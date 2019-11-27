class LikesController < ApplicationController
    before_action :current_user

    def create
      # @diary = Diary.find(params[:id])
      Like.create(like_params)
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'いいねしました'}
        format.json
      end
    end

    def destory
  
      redirect_to root_path
    end

    private
    def like_params
      params.permit().merge(user_id: current_user.id, diary_id: params[:diary_id])
    end
  end
